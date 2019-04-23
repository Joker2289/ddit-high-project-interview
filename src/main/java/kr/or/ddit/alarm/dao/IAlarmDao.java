package kr.or.ddit.alarm.dao;

import java.util.List;

import kr.or.ddit.alarm.model.AlarmVo;
import kr.or.ddit.util.pagination.PaginationVo;

public interface IAlarmDao {
	
	/**
	 * Method : insert_alarmInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param alarmVo
	 * @return
	 * Method 설명 : 알림 등록
	 */
	int insert_alarmInfo(AlarmVo alarmVo);
	
	/**
	 * Method : update_alarmStatus
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param alarmVo
	 * @return
	 * Method 설명 : 알림 확인
	 */
	int update_alarmStatus(AlarmVo alarmVo);
	
	/**
	 * Method : delete_alarmInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param alarm_code
	 * @return
	 * Method 설명 : 알림 삭제
	 */
	int delete_alarmInfo(String alarm_code);
	
	/**
	 * Method : select_recentAlarmList
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 최근(일주일) 알림 조회
	 */
	List<AlarmVo> select_recentAlarmList(PaginationVo paginationVo);
	
	/**
	 * Method : select_nextRecentAlarm
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 최근(일주일) 알림 다음페이지
	 */
	List<AlarmVo> select_nextRecentAlarm(PaginationVo paginationVo);
	
	/**
	 * Method : select_previousAlarmList
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 이전 알림 조회
	 */
	List<AlarmVo> select_previousAlarmList(PaginationVo paginationVo);
	
	/**
	 * Method : select_nextPreviousAlarm
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param paginationVo
	 * @return
	 * Method 설명 : 이전 알림 다음페이지
	 */
	List<AlarmVo> select_nextPreviousAlarm(PaginationVo paginationVo);
	
	/**
	 * Method : select_newAlarmCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 새 알람 갯수
	 */
	int select_newAlarmCount(String mem_id);
	
	/**
	 * Method : select_recentCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 최근 알림 갯수
	 */
	int select_recentCount(String mem_id);
	
	/**
	 * Method : select_previousCount
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 이전 알림 갯수
	 */
	int select_previousCount(String mem_id);
	
	/**
	 * Method : delete_goodalarm
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param alarmVo
	 * @return
	 * Method 설명 : 좋아요 알람 삭제
	 */
	int delete_goodalarm(AlarmVo alarmVo);
}
