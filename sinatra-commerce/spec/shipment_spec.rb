require_relative '../app/models/shipment'
require_relative '../app/models/order'
require_relative '../app/models/shipment_tracking'

RSpec.describe Shipment do 
    let(:order) { Order.find("2407070NDEQYGS")}
    let(:tracking) { ShipmentTracking.new("")}
    let(:shipment) { Shipment.new(tracking)}
end

=begin

order_no='2407070NDEQYGS'
order_id='174023000251929'

tracking.details = {

}

shipment_name={
    'Anteraja Economy'
    '11000248303154'
}

11-07-2024 16:50


state='Terkirim'
Pesanan telah sampai
Penerima: Sallah(Penerima asli). 
    (Lihat Bukti Pengiriman.) bukti_pengiriman.type = image

Pesanan dalam Pengiriman

11-07-2024 13:57
state_text=Pesanan dalam Pengiriman

Pesanan sedang diantar ke alamat tujuan

09-07-2024 22:11
Pesanan telah sampai di lokasi sortir Kendari

08-07-2024 12:46
Pesanan telah sampai di lokasi sortir

08-07-2024 00:42
Pesanan telah sampai di lokasi sortir Jakarta Timur

08-07-2024 00:11
Pesananmu sedang diproses di pusat penyortiran Jakarta Utara

07-07-2024 23:48
Pesanan telah sampai di lokasi sortir

07-07-2024 20:41
Pesanan telah diserahkan ke jasa kirim untuk diproses

Sedang Dikemas
07-07-2024 14:00
Sedang Dikemas

Penjual telah mengatur pengiriman. Menunggu pesanan diserahkan ke pihak jasa kirim

Pesanan Dibuat
07-07-2024 11:43
Pesanan Dibuat

List state
1. Terkirim
2. Pesanan dalam Pengiriman
3. Sedang Dikemas
4. Pesanan Dibuat
=end