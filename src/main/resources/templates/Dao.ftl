
import ${package_name}.module.model.${model_name_uc}VO;
import net.paoding.rose.jade.annotation.DAO;
import net.paoding.rose.jade.annotation.ReturnGeneratedKeys;
import net.paoding.rose.jade.annotation.SQL;
import net.paoding.rose.jade.annotation.SQLParam;

import java.util.Collection;
import java.util.List;

/**
* 描述：
*/
@DAO
public interface ${model_name_uc}DAO{

	static final String BASE_COLUMN_LIST=" <#list model_column as model>${model.column_name}<#if model_has_next>,</#if></#list> ";
	static final String INSERT_COLUMN_LIST= " <#list model_column as model><#if model_index != 0 && model.column_name != 'create_time' && model.column_name != 'update_time' && model.column_name != 'is_deleted'>${model.column_name?uncap_first} <#if model_has_next  && model_column[model_index+1].column_name != 'create_time' && model_column[model_index+1].column_name != 'update_time' && model_column[model_index+1].column_name != 'is_deleted'>,</#if></#if></#list>  ";

	@SQL("select "+BASE_COLUMN_LIST+" from ${model_name} order by update_time desc limit 1")
	${model_name_uc}VO selectLast${model_name_uc}();

	<#--@Autowired
	JdbcTemplate jdbcTemplate;

	public Map<String,Object> add(${model_name} ${model_name?uncap_first}){
		final String sql="insert into ${table_name_small} (<#list model_column as model>${model.columnName}<#if model_has_next>,</#if></#list>) values (<#list model_column as model>?<#if model_has_next>,</#if></#list>)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
		@Override
		public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
			PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			<#list model_column as model>
			ps.setObject(${model_index+1},${table_name?uncap_first}.get${model.changeColumnName}());
			</#list>
			return ps;
		}
		}, keyHolder);
	return findById(String.valueOf(keyHolder.getKey().longValue()));
	}

	public Map<String,Object> findById(String id){
		String sql="select <#list model_column as model>${model.columnName?uncap_first}<#if model_has_next>,</#if></#list> from ${table_name_small} where id=? and deleted=0";
		try {
			return jdbcTemplate.queryForMap(sql,id);
		}catch (Exception e){
			return null;
		}
	}

	public int delete(String id){
		String sql="update ${table_name_small} set deleted=1 where id=? and deleted=0";
		return jdbcTemplate.update(sql,id);
	}

	public int update(${table_name} ${table_name?uncap_first}){
		String sql="update ${table_name_small} set <#list model_column as model><#if model_index != 0 && model.columnName != 'create_time' && model.columnName != 'create_user' && model.columnName != 'deleted'>${model.columnName?uncap_first}=?<#if model_has_next>,</#if></#if></#list> where id=? and deleted=0";
		return jdbcTemplate.update(sql,<#list model_column as model><#if model_index != 0&& model.columnName != 'create_time' && model.columnName != 'create_user' && model.columnName != 'deleted'>${table_name?uncap_first}.get${model.changeColumnName}()<#if model_has_next && model_column[model_index+1].columnName != 'createTime'>,</#if></#if></#list>,${table_name?uncap_first}.getId());
	}

	public List<Map<String,Object>> list(PageBean pageBean,${table_name} ${table_name?uncap_first}){
		StringBuffer sql=new StringBuffer("select <#list model_column as model>${model.columnName?uncap_first}<#if model_has_next>,</#if></#list> from ${table_name_small} where deleted=0");
		sql.append(" limit ?,?");
		return jdbcTemplate.queryForList(sql.toString(),pageBean.getStart(),pageBean.getPageSize());
	}

	public Map<String,Object> count(${table_name} ${table_name?uncap_first}){
		StringBuffer sql=new StringBuffer("select count(id) as total from ${table_name_small} where deleted=0");
		return jdbcTemplate.queryForMap(sql.toString());
	}-->
}