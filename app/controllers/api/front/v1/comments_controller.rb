# frozen_string_literal: true

# api
module Api
  # front
  module Front
    # v1
    module V1
      # Comments Controller
      class CommentsController < Api::Front::V1::ApiController
        before_action :set_case

        def create
          success, comment = @case.create_comment(user: current_user, frame_id: params[:frame_id],
                                                  form_params:)
          if success
            # logger.debug CommentSerializer.new(comment).serialized_json
            render json: CommentSerializer.new(comment).serializable_hash
          else
            head :no_content
          end
        end

        def destroy
          @case.delete_comment(user: current_user, comment_id: params[:id])
          head :no_content
        end

        private

        def set_case
          @case = CommentsCase.new
        end

        def form_params
          params.require(:comment).permit(:body)
        end
      end
    end
  end
end
