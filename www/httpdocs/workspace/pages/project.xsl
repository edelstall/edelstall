<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:import href="../utilities/master.xsl"/>


<xsl:template match="data">
	
	
	<xsl:if test="$member-is-logged-in">
		
		<xsl:for-each select="//events/project-create">
		
						<xsl:call-template name="form-messages" />
									
					</xsl:for-each>

		<h1>Share</h1>
		<form method="post" autocomplete="off" action="" id="register-form" enctype="multipart/form-data">
		
			<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
			  <input name="fields[member]" type="hidden" value="{//members/entry/@id}" />
			  
			  <input name="id" type="hidden" value="52" />
			  
			<fieldset>
									<legend>Add a project</legend>	
				<div>
					
					<xsl:attribute name="class">
						<xsl:text>clearfix</xsl:text>
						<xsl:if test="//events/project-create/name">
							<xsl:text> error</xsl:text>
						</xsl:if>
					</xsl:attribute>
					
					<label for="project-name">Name</label>
					<div class="input">
						<input name="fields[name][value-{$url-language}]" id="project-name" type="text" 
							value="{//events/project-create/post-values/name}" />
					</div>
				</div>
				
				<div>
					
					<xsl:attribute name="class">
						<xsl:text>clearfix</xsl:text>
						<xsl:if test="//events/project-create/url">
							<xsl:text> error</xsl:text>
						</xsl:if>
					</xsl:attribute>
					
					<label for="project-url">URL</label>
					<div class="input">
						<input name="fields[url][value-{$url-language}]" id="project-url" type="text" 
							value="{//events/project-create/post-values/url}" />
					</div>
				</div>
			
				<div class="clearfix">
				<xsl:attribute name="class">
					<xsl:text>clearfix</xsl:text>
					<xsl:if test="//events/project-create/cover">
						<xsl:text> error</xsl:text>
					</xsl:if>
				</xsl:attribute>
					<label for="project-cover">Cover</label>
					<div class="input">
						<input class="input-file" id="project-cover" name="fields[cover]" type="file" />
						<span class="help-block">
							Upload an image ( BMP, JPG, GIF, PNG )
						</span>
					</div>
				</div>
			<!--			
				<div class="clearfix">
					<label for="fileInput">Image 1</label>
					<div class="input">
						<input class="input-file" id="fileInput" name="fileInput" type="file" />
					</div>
				</div>
				
				<div class="clearfix">
					<label for="fileInput">Image 2</label>
					<div class="input">
						<input class="input-file" id="fileInput" name="fileInput" type="file" />
					</div>
				</div>
				
				<div class="clearfix">
					<label for="fileInput">Image 3</label>
					<div class="input">
						<input class="input-file" id="fileInput" name="fileInput" type="file" />
					</div>
				</div>-->
				
				<div class="clearfix">
					<label for="textarea">Description</label>
					<div class="input">
						<textarea class="xxlarge" id="textarea" name="fields[description][value-{$url-language}]" rows="3">
							<xsl:value-of select="//events/project-create/post-values/description" disable-output-escaping="yes" />
						</textarea>
						<span class="help-block">
							This field uses <a href="http://daringfireball.net/projects/markdown/dingus" target="_blank">markdown</a>
						</span>
					</div>
				</div>
				
				
				<div class="actions">
					<input type="submit" class="btn primary large" name="action[project-create]" value="Add" />
				</div>
				
			</fieldset>
			
			<!--<input type="hidden" name="fields[role]" value="1" />
			<input name="redirect" type="hidden" value="{$root}/member/new/thanks/" />-->
			
		</form>

				
		<p><strong><xsl:value-of select="//members/entry/first-name" disable-output-escaping="yes" /></strong>, you are logged in. (<a href="?member-action=logout&amp;redirect={$current-url}">Logout</a>)</p>
			

	</xsl:if>
			


</xsl:template>






</xsl:stylesheet>