Þ          T                                  =  º   Ò  Z     ²   è  v            "     ²     7  H   Ö  µ      Dual Grid Approach In AMReX-based applications that have both mesh data and particle data, the mesh work and particle work have very different requirements for load balancing. Rather than using a combined work estimate to create the same grids for mesh and particle data, we have the option to pursue a "dual grid" approach. The cost of this strategy, of course, is the need to copy mesh data onto temporary :cpp:`MultiFabs` defined on the particle :cpp:`BoxArrays` when mesh-particle communication is required. This enables separate load balancing strategies to be used for the mesh and particle work. With this approach the mesh (:cpp:`MultiFab`) and particle (:cpp:`ParticleContainer`) data are allocated on different :cpp:`BoxArrays` with different :cpp:`DistributionMappings`. Project-Id-Version: amrex 23.00-dev
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-11-02 14:37+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: gpt-po v1.0.11
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.13.1
 åç½æ ¼æ¹æ³ å¨åºäºAMReXçåºç¨ç¨åºä¸­ï¼æ¢æç½æ ¼æ°æ®åæç²å­æ°æ®ï¼ç½æ ¼å·¥ä½åç²å­å·¥ä½å¯¹è´è½½å¹³è¡¡æéå¸¸ä¸åçè¦æ±ã ä¸å¶ä½¿ç¨ä¸ä¸ªç»¼åçå·¥ä½ä¼°è®¡æ¥åå»ºç½æ ¼åç²å­æ°æ®çç¸åç½æ ¼ï¼æä»¬æéæ©éç¨âåç½æ ¼âæ¹æ³ã å½ç¶ï¼è¿ç§ç­ç¥çä»£ä»·æ¯å¨éè¦è¿è¡ç½æ ¼-ç²å­éä¿¡æ¶ï¼éè¦å°ç½æ ¼æ°æ®å¤å¶å°å¨ç²å­`BoxArrays`ä¸å®ä¹çä¸´æ¶`MultiFabs`ä¸­ã è¿æ ·å¯ä»¥ä¸ºç½æ ¼åç²å­å·¥ä½ä½¿ç¨ä¸åçè´è½½åè¡¡ç­ç¥ã éç¨è¿ç§æ¹æ³ï¼ç½æ ¼ï¼:cpp:`MultiFab`ï¼åç²å­ï¼:cpp:`ParticleContainer`ï¼æ°æ®å¨ä¸åç:cpp:`BoxArrays`ä¸åéï¼å¹¶å·æä¸åç:cpp:`DistributionMappings`ã 