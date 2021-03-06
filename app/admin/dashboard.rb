ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do   
    section "Recent Participants" do
      table_for Participant.order("created_at desc").limit(10) do
        column :id do |participant|
          link_to participant.id, [:admin, participant]
        end
        column :uuid
        column "Participant Type ID", :participant_type_id do |participant|
          link_to participant.participant_type_id, [:admin, participant.participant_type]
        end
        column :created_at
        column :updated_at
      end
      strong { link_to "View All Participants", admin_participants_path }
    end
  end 
end
