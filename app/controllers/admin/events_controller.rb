module Admin
  class EventsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Event.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Event.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def download
      event = Event.find(params[:event][:id].to_i)
      csv = event.print_attendees
      send_data csv, filename: "#{event.slug}.csv", type: 'text/csv'
    end

    def create
      params[:event][:label_xml] = File.read(params.dig(:event, :label_xml).tempfile) if params.dig(:event, :label_xml)
      super
    end

    def update
      params[:event][:label_xml] = File.read(params.dig(:event, :label_xml).tempfile) if params.dig(:event, :label_xml)
      super
    end
  end
end
