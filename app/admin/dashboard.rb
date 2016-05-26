ActiveAdmin.register_page "Dashboard" do
  # controller do
  #   after_action :skip_policy_scope
  #   after_action :skip_authorization
  # end

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  def index
    authorize :dashboards, :index?
  end

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    div class: "bonjour" do
      p "bonjour #{current_user.email}"
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Missions" do
    #       ul do
    #         Mission.last(5).map do |mission|
    #           li link_to(mission.id, admin_mission_path(mission))
    #         end
    #       end
    #     end
    #   end

    #   # column do
    #   #   panel "Info" do
    #   #     para "Welcome to ActiveAdmin."
    #   #   end
    #   # end
    # end
  end # content
end
