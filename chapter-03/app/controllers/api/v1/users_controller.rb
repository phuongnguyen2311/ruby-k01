class Api::V1::UsersController < Api::V1::BaseController
  
    def index
      users = (params[:email].present? ? User.where(email: params[:email]) : User.all).paginate(page:
        params[:page])
      render json: success_message('Successfully', users)
    end
  
    def friends
      following_id = current_user.following.pluck(:id)
      following_id << current_user.id
      users = User.where.not(id: following_id).paginate(page: params[:page], per_page: 4)
      total_pages = users.total_pages
      next_page = params[:page].to_i + 1
      render json: success_message('Successfully', { users: ActiveModelSerializers::SerializableResource.new(users, each_serializer: UsersSerializer),
                                                     total_pages: total_pages,
                                                     next_page: next_page })
    end

    def following
      user = User.find(params[:id])
      current_user.follow(user)
      following_id = current_user.following.pluck(:id)
      following_id << current_user.id
      users = users = User.where.not(id: following_id).paginate(page: params[:page], per_page: 4)
      total_pages = users.total_pages
      next_page = 2
      render json: success_message('Successfully', { users: ActiveModelSerializers::SerializableResource.new(users, each_serializer: UsersSerializer),
                                                     total_pages: total_pages,
                                                     next_page: next_page,
                                                     user: user})
    end
  end
