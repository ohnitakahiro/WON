class EventsController < UsersController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  # GET /events
  # GET /events.json
  def index
    @all_events = Event.all.includes(:user)
    @user = User.find(current_user.id)
    
   #フォローしているユーザーを取得
    @follow_users = @user.followings.map { |f| f[:id] }
    @follow_users << current_user.id
    
   #フォローユーザーの投稿のみ表示
    @events_onlyfollow = @all_events.where(user_id: @follow_users).order("created_at DESC")
    # 自分の投稿のみ
    @events = Event.where(user_id: current_user.id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @comments = @event.comments.includes(:user)
  end

  # GET /events/new
  def new
    @event = Event.new
    @menu = @event.menus.build
    @menu_set = @menu.menu_sets.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    index
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: '記録完了' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to root_path, notice: '※記録失敗（本文が空白です）' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event.destroy
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: '記録の変更完了' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: '記録削除' }
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :body, :start_date, :end_date, :image, menus_attributes: [:name, :part, menu_sets_attributes:[:number, :number_unit, :rep, :rep_unit]]).merge(user_id: current_user.id)
      
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
