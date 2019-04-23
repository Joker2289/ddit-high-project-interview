package kr.or.ddit.alarm.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Repository("alarmDao")
public class AlarmDaoImpl implements IAlarmDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_alarmInfo(AlarmVo alarmVo) {
		return sqlSession.insert("alarm.insert_alarmInfo", alarmVo);
	}

	@Override
	public int update_alarmStatus(AlarmVo alarmVo) {
		return sqlSession.update("alarm.update_alarmStatus", alarmVo);
	}

	@Override
	public int delete_alarmInfo(String alarm_code) {
		return sqlSession.delete("alarm.delete_alarmInfo", alarm_code);
	}

	@Override
	public List<AlarmVo> select_recentAlarmList(PaginationVo paginationVo) {
		return sqlSession.selectList("alarm.select_recentAlarmList", paginationVo);
	}

	@Override
	public List<AlarmVo> select_previousAlarmList(PaginationVo paginationVo) {
		return sqlSession.selectList("alarm.select_previousAlarmList", paginationVo);
	}

	@Override
	public int select_newAlarmCount(String mem_id) {
		return sqlSession.selectOne("alarm.select_newAlarmCount", mem_id);
	}

	@Override
	public List<AlarmVo> select_nextRecentAlarm(PaginationVo paginationVo) {
		return sqlSession.selectList("alarm.select_nextRecentAlarm", paginationVo);
	}

	@Override
	public List<AlarmVo> select_nextPreviousAlarm(PaginationVo paginationVo) {
		return sqlSession.selectList("alarm.select_nextPreviousAlarm", paginationVo);
	}

	@Override
	public int select_recentCount(String mem_id) {
		return sqlSession.selectOne("alarm.select_recentCount", mem_id);
	}

	@Override
	public int select_previousCount(String mem_id) {
		return sqlSession.selectOne("alarm.select_previousCount", mem_id);
	}

	@Override
	public int delete_goodalarm(AlarmVo alarmVo) {
		return sqlSession.delete("alarm.delete_goodalarm", alarmVo);
	}

}
