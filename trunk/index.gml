<gm:page title="Calendar" css="/css/g.css" class="googleTheme">

  <!--
       The calendar application demonstrates calendar feed to select items
       from the user's calendar and view the details of that entry.     
       @author: GME Team
  -->
  

  <gm:data id="cal" data="http://www.google.com/calendar/feeds/2odmstb4hh1qcmg4ml8pj1uoo4%40group.calendar.google.com/public/full?orderby=starttime&sortorder=ascending"/>

  <div class="gm-app-header">
    <table>
      <tr>
        <td style="padding-right: 50px;">
          <h1>Calendar</h1>
        Dates that have events are underlined on the calendar. Click the date to see the events for that day.
        </td>
      </tr>
    </table>
  </div>

  <table class="gm-padded" width="100%">
    <tr valign="top">
      <td width="250" style="padding-right:20px">
        <gm:calendar id="myCalendar" data="${cal}">
          <gm:handleEvent src="myList" event="select"/>
        </gm:calendar>
      </td>
      <td>
        <div style="height: 200px; overflow: auto;">
          <gm:list id="myList" data="${cal}" template="events">
            <gm:handleEvent src="myCalendar" event="select"/>
          </gm:list> 
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <hr size="1"/>
        <gm:item id="detail" template="detailedEvents">
          <gm:handleEvent src="myCalendar" event="select"/>
          <gm:handleEvent src="myList" event="select"/>
        </gm:item>
      </td>
    </tr>
  </table>

  <gm:template id="events">
    <table class="gm-small">
      <tr repeat="true">
        <td><b><gm:date ref="gd:when/@startTime"/></b></td>
        <td><gm:text ref="atom:title" style="overflow:hidden"/></td>
      </tr>
   </table>
  </gm:template>
  
   <gm:template id="detailedEvents">
    <table>
      <tbody repeat="true">
        <tr>
          <td style="font-size:18px"><b><gm:date ref="gd:when/@startTime"/></b> - <gm:text ref="atom:title"/></td>
        </tr>
        <tr>
          <td style="font-size:15px">Location: <gm:text ref="gd:where/@valueString"/></td>
        </tr>
        <tr>
          <td>Author: <gm:text ref="atom:author/atom:name"/></td>
        </tr>
      </tbody>
   </table>
  </gm:template>

</gm:page>

