class RoomStats
  def newVisit(room_id)
    stat = RoomStat.new
    stat.room_id = room_id
    stat.request_ip = env['REMOTE_ADDR']
    rs = RoomStat.where(['room_id = ? and request_ip = ?', stat.room_id, stat.request_ip]
    if rs.size == 1
      return true
    else
      return false
    end

    end
  end
end
