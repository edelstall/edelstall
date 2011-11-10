<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:import href="../utilities/master.xsl"/>



<xsl:template match="data">
		 

<xsl:choose>
	<xsl:when test="$member-is-logged-in">
		<p>You are logged in. (<a href="?member-action=logout&amp;redirect={$current-url}">Logout</a>)</p>
	</xsl:when>
	<xsl:otherwise>
		
		<xsl:choose>
			<xsl:when test="$pt1 = 'new' and not($pt2)">
				
				<h1>Register</h1>
				
				<xsl:for-each select="//events/members-create">
	
					<xsl:if test="@result = 'error'">
						
						<div class="alert-message block-message error">
							<!--<a class="close" href="#">×</a>-->
							<p><strong><xsl:value-of select="message" /></strong></p>
							<ul>
								<xsl:for-each select="node()">
									<xsl:if test="string-length(@message)">
										<li><xsl:value-of select="@message" /></li>
									</xsl:if>
								</xsl:for-each>
							</ul>
						</div>
						
					</xsl:if>
					
					<xsl:if test="@result = 'success'">
						
						<div class="alert-message success">
							<!--<a class="close" href="#">×</a>-->
							<p><xsl:value-of select="message" /></p>
						</div>
						
					</xsl:if>
								
				</xsl:for-each>

				
				<form method="post" autocomplete="off" action="" id="register-form">
				
					<fieldset>
						
						<legend><xsl:value-of select="$website-name" /> membership</legend>
						
						<div>
							
							<xsl:attribute name="class">
								<xsl:text>clearfix</xsl:text>
								<xsl:if test="//events/members-create/first-name">
									<xsl:text> error</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<label for="register-first-name">First name</label>
							<div class="input">
								<input name="fields[first-name]" id="register-first-name" type="text" 
									value="{//events/members-create/post-values/first-name}" />
							</div>
						</div>
						
						<div>
						
							<xsl:attribute name="class">
								<xsl:text>clearfix</xsl:text>
								<xsl:if test="//events/members-create/last-name">
									<xsl:text> error</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<label for="register-last-name">Last name</label>
							
							<div class="input">
								<input class="xlarge" name="fields[last-name]" id="register-last-name" type="text"
									value="{//events/members-create/post-values/last-name}">
								</input>
							</div>
						</div>
						
						<div>
							
							<xsl:attribute name="class">
								<xsl:text>clearfix</xsl:text>
								<xsl:if test="//events/members-create/email">
									<xsl:text> error</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<label for="register-email">Email</label>
							<div class="input">
								<input class="xlarge" id="register-email" name="fields[email]" type="text"
									value="{//events/members-create/post-values/email}" />
							</div>
						</div>
						
						<div class="clearfix" id="register-date-fields">
							
							<xsl:attribute name="class">
								<xsl:text>clearfix</xsl:text>
								<xsl:if test="
									not(//events/members-create/post-values/birthday) and
									//events/members-create
									">
									<xsl:text> error</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<label for="register-date-month">Birthday</label>
							
							<input type="hidden" name="fields[birthday][start][]" id="register-date"
								value="{//events/members-create/post-values/birthday/start/item}" />
							<input type="hidden" name="fields[register-date-day-value]" id="register-date-day-value"
								value="{//events/members-create/post-values/register-date-day}" />
							<input type="hidden" name="fields[register-date-month-value]" id="register-date-month-value"
								value="{//events/members-create/post-values/register-date-month}" />
							<input type="hidden" name="fields[register-date-year-value]" id="register-date-year-value"
								value="{//events/members-create/post-values/register-date-year}" />
							
							<div class="input">
								<select class="medium span2" name="fields[register-date-month]" id="register-date-month">
									<option value="-1">Month</option>
									<option value="January">Jan</option>
									<option value="February">Feb</option>
									<option value="March">Mar</option>
									<option value="April">Apr</option>
									<option value="May">May</option>
									<option value="June">Jun</option>
									<option value="July">Jul</option>
									<option value="August">Aug</option>
									<option value="September">Sep</option>
									<option value="October">Oct</option>
									<option value="November">Nov</option>
									<option value="December">Dec</option>
								</select>
								<xsl:text>&#160;</xsl:text>
								<select class="medium span2" name="fields[register-date-day]" id="register-date-day">
									<option value="-1">Day</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
								<xsl:text>&#160;</xsl:text>
								<select class="medium span2" name="fields[register-date-year]" id="register-date-year">
									<option value="-1">Year</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
									<option value="2008">2008</option>
									<option value="2007">2007</option>
									<option value="2006">2006</option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
									<option value="1979">1979</option>
									<option value="1978">1978</option>
									<option value="1977">1977</option>
									<option value="1976">1976</option>
									<option value="1975">1975</option>
									<option value="1974">1974</option>
									<option value="1973">1973</option>
									<option value="1972">1972</option>
									<option value="1971">1971</option>
									<option value="1970">1970</option>
									<option value="1969">1969</option>
									<option value="1968">1968</option>
									<option value="1967">1967</option>
									<option value="1966">1966</option>
									<option value="1965">1965</option>
									<option value="1964">1964</option>
									<option value="1963">1963</option>
									<option value="1962">1962</option>
									<option value="1961">1961</option>
									<option value="1960">1960</option>
									<option value="1959">1959</option>
									<option value="1958">1958</option>
									<option value="1957">1957</option>
									<option value="1956">1956</option>
									<option value="1955">1955</option>
									<option value="1954">1954</option>
									<option value="1953">1953</option>
									<option value="1952">1952</option>
									<option value="1951">1951</option>
									<option value="1950">1950</option>
									<option value="1949">1949</option>
									<option value="1948">1948</option>
									<option value="1947">1947</option>
									<option value="1946">1946</option>
									<option value="1945">1945</option>
									<option value="1944">1944</option>
									<option value="1943">1943</option>
									<option value="1942">1942</option>
									<option value="1941">1941</option>
									<option value="1940">1940</option>
									<option value="1939">1939</option>
									<option value="1938">1938</option>
									<option value="1937">1937</option>
									<option value="1936">1936</option>
									<option value="1935">1935</option>
									<option value="1934">1934</option>
									<option value="1933">1933</option>
									<option value="1932">1932</option>
									<option value="1931">1931</option>
									<option value="1930">1930</option>
									<option value="1929">1929</option>
									<option value="1928">1928</option>
									<option value="1927">1927</option>
									<option value="1926">1926</option>
									<option value="1925">1925</option>
									<option value="1924">1924</option>
									<option value="1923">1923</option>
									<option value="1922">1922</option>
									<option value="1921">1921</option>
									<option value="1920">1920</option>
									<option value="1919">1919</option>
									<option value="1918">1918</option>
									<option value="1917">1917</option>
									<option value="1916">1916</option>
									<option value="1915">1915</option>
									<option value="1914">1914</option>
									<option value="1913">1913</option>
									<option value="1912">1912</option>
									<option value="1911">1911</option>
									<option value="1910">1910</option>
									<option value="1909">1909</option>
									<option value="1908">1908</option>
									<option value="1907">1907</option>
									<option value="1906">1906</option>
									<option value="1905">1905</option>
								</select>
							</div>
						</div>		
						
						<div>
							
							<xsl:attribute name="class">
								<xsl:text>clearfix</xsl:text>
								<xsl:if test="//events/members-create/gender">
									<xsl:text> error</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<label id="register-gender">Gender</label>
							<div class="input">
								<ul class="inputs-list">
									<li>
										<label>
											<input type="radio" name="fields[gender]" value="Male">
												<xsl:if test="//events/members-create/post-values/gender = 'Male'">
													<xsl:attribute name="checked">
														<xsl:text>checked</xsl:text>
													</xsl:attribute>
												</xsl:if>
											</input>
											<span> Male</span>
										</label>
									</li>
									<li>
										<label>
											<input type="radio" name="fields[gender]" value="Female">
												<xsl:if test="//events/members-create/post-values/gender = 'Female'">
													<xsl:attribute name="checked">
														<xsl:text>checked</xsl:text>
													</xsl:attribute>
												</xsl:if>
											</input>
											<span> Female</span>
										</label>
									</li>
								</ul>
							</div>
						</div>
				
						<div>
							
							<xsl:attribute name="class">
								<xsl:text>clearfix</xsl:text>
								<xsl:if test="//events/members-create/password">
									<xsl:text> error</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<label for="register-password">Password</label>
							<div class="input">
								<input class="xlarge" id="register-password" name="fields[password][password]" type="password"
									value="{//events/members-create/post-values/password/password}" />
							</div>
						</div>
						
						<div>
							
							<xsl:attribute name="class">
								<xsl:text>clearfix</xsl:text>
								<xsl:if test="//events/members-create/password">
									<xsl:text> error</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<label for="register-password-confirm">Confirm password</label>
							<div class="input">
								<input class="xlarge" id="register-password-confirm" name="fields[password][confirm]" type="password"
									value="{//events/members-create/post-values/password/confirm}" />
							</div>
						</div>
						
						<div class="actions">
							<input type="submit" class="btn primary large" name="action[members-create]" value="Login" id="register-submit" />
						</div>
						
					</fieldset>
					
					<input type="hidden" name="fields[role]" value="1" />
					<input name="redirect" type="hidden" value="{$root}/member/new/thanks/" />
					
				</form>
				
			</xsl:when>
			<xsl:when test="$pt1 = 'new' and $pt2 = 'thanks'">
				
				<h1>Thanks</h1>
				
				<p>We’ll review your membership and shoot you an email when your account is activated.</p>
				
				<p><a href="{$root}">« Back home</a></p>
				
			</xsl:when>
			<xsl:when test="$pt1 = 'forgot-password'">
				
				<h1>Generate password recovery code</h1>
				<xsl:call-template name="members-form-generate-recovery-code"/>
				
				
			</xsl:when>
			<xsl:otherwise>
				
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:otherwise>
</xsl:choose>


		   	      
		


</xsl:template>





</xsl:stylesheet>