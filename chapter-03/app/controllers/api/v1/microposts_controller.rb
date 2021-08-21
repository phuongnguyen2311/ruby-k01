class Api::V1::MicropostsController < Api::V1::BaseController
  def love
    post = Micropost.find_by(id: params[:micropost_id])
    if post
      user_name = current_user.name
      logger = Logger.new("log/abc.log")
      if post.loves.nil?
        loves = loves.blank? ? user_name : loves.concat("," + user_name)
      else
        loves = post.loves
        logger.info "User: #{post.inspect} ------#{loves}-----#{loves.include?(user_name)}"
        render json: success_message('Successfully', loves) and return if loves.include?(user_name)
        loves = loves.blank? ? user_name : loves.concat("," + user_name)
      end
      post.loves = loves
      if post.save
        render json: success_message('Successfully', loves)
      else
        render json: error_message(t "micropost.not_found")
      end
    else
      render json: error_message(t "micropost.not_found")
    end
  end

  def comment
    comment = current_user.comments.new(content: params[:comment], micropost_id: params[:micropost_id])
    if comment.save
      render json: success_message('Successfully', { avatar: gravatar_for_user(current_user), comment: comment, micropost_id: params[:micropost_id] })
    else
      render json: error_message(t "micropost.not_found")
    end
  end
  
end
