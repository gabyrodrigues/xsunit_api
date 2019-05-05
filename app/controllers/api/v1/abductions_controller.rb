class Api::V1::AbductionsController < Api::V1::ApiController
		
	# GET /api/v1/abductions
	def index
		abductions = Abduction.order(created_at: :desc)
   		render json: abductions
	end

	 # GET /api/v1/abductions/1
	def show
		abduction = Abduction.find(params[:id])
		render json: abduction
	end

	# POST /api/v1/abductions
	def create
 
		abduction = Abduction.new(abduction_params)

		if abduction.save

			#flagging survivor as abducted when at least three other survivors report their abduction
			survivor = Survivor.find(abduction.survivor.id)
			abductions = Abduction.where(survivor_id: survivor.id)

			if abductions.count >= 3
				survivor.update(abducted: true)
			end

			render json: abduction, status: 201

		else
			render json: { errors: abduction.errors }, status: 422
		end

	end

	# PATCH/PUT /api/v1/abductions/1
	def update
		abduction = Abduction.find(params[:id])

		if abduction.update(abduction_params)
			render json: abduction, status: 200
		else
			render json: { errors: abduction.errors }, status: 422
		end
	end

	# DELETE /api/v1/abductions/1
	def destroy

		abduction = Abduction.find(params[:id])

		abduction.destroy

		render json: {status: 200, message:'Abduction deleted'}
	end

	#allowed params
	private
	def abduction_params
		params.permit(:survivor_id, :abducted)
	end
end
