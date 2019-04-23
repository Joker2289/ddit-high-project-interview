package kr.or.ddit.alarm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.alarm.dao.IAlarmDao;
import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Service("alarmService")
public class AlarmServiceImpl implements IAlarmService {

	@Resource(name="alarmDao")
	private IAlarmDao alarmDao;
	
	@Override
	public int insert_alarmInfo(AlarmVo alarmVo) {
		return alarmDao.insert_alarmInfo(alarmVo);
	}

	@Override
	public int update_alarmStatus(AlarmVo alarmVo) {
		return alarmDao.update_alarmStatus(alarmVo);
	}

	@Override
	public int delete_alarmInfo(String alarm_code) {
		return alarmDao.delete_alarmInfo(alarm_code);
	}

	@Override
	public List<AlarmVo> select_recentAlarmList(PaginationVo paginationVo) {
		return alarmDao.select_recentAlarmList(paginationVo);
	}

	@Override
	public List<AlarmVo> select_previousAlarmList(PaginationVo paginationVo) {
		return alarmDao.select_previousAlarmList(paginationVo);
	}

	@Override
	public int select_newAlarmCount(String mem_id) {
		return alarmDao.select_newAlarmCount(mem_id);
	}

	@Override
	public List<AlarmVo> select_nextRecentAlarm(PaginationVo paginationVo) {
		return alarmDao.select_nextRecentAlarm(paginationVo);
	}

	@Override
	public List<AlarmVo> select_nextPreviousAlarm(PaginationVo paginationVo) {
		return alarmDao.select_nextPreviousAlarm(paginationVo);
	}

	@Override
	public int select_recentCount(String mem_id) {
		return alarmDao.select_recentCount(mem_id);
	}

	@Override
	public int select_previousCount(String mem_id) {
		return alarmDao.select_previousCount(mem_id);
	}

	@Override
	public int delete_goodalarm(AlarmVo alarmVo) {
		return alarmDao.delete_goodalarm(alarmVo);
	}
	
}
