Sequel.migration do
    change do
        create_table :dukcapil_log do
            primary_key :id
            String :check_id
            String :nik_checked
            String :checker_id
            Time :created_at
        end
    end
end