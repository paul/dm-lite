
DMLite.setup(:sharded,
             :adapter => :sharded_mysql,
             :connections => [
               'mysql://db1/db',
               'mysql://db2/db',
               'mysql://db3/db'
             ],
             :algorithm => lambda { |resource| resource.id.slice(0,2).to_i % 3 }
            )


class Photo

  property :id, UUID

  repo :default do
    property :photographer,   String
    property :taken_at,       DateTime
  end

  repo :s3 do
    property :image,  ImageBlob
  end

end
