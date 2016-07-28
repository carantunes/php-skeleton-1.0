{extends file="layout.tpl"}

{block name=body}
<div class="container">
    <h2>You are in the View: application/view/song/index.php (everything in this box comes from that file)</h2>
    <!-- add song form -->
    <div class="box">
        <h3>Add a song</h3>
        <form action="/songs/addsong" method="POST">
            <label>Artist</label>
            <input type="text" name="artist" value="" required />
            <label>Track</label>
            <input type="text" name="track" value="" required />
            <label>Link</label>
            <input type="text" name="link" value="" />
            <input type="submit" name="submit_add_song" value="Submit" />
        </form>
    </div>
    <!-- main content output -->
    <div class="box">
        <h3>Amount of songs (data from second model)</h3>
        <div>
            {$total_of_songs}
        </div>
        <h3>Amount of songs (via AJAX)</h3>
        <div>
            <button id="javascript-ajax-button">Click here to get the amount of songs via Ajax (will be displayed in #javascript-ajax-result-box)</button>
            <div id="javascript-ajax-result-box"></div>
        </div>
        <h3>List of songs (data from first model)</h3>
        <table>
            <thead style="background-color: #ddd; font-weight: bold;">
            <tr>
                <td>Id</td>
                <td>Artist</td>
                <td>Track</td>
                <td>Link</td>
                <td>DELETE</td>
                <td>EDIT</td>
            </tr>
            </thead>
            <tbody>
            {foreach from=$songs item=song}
                <tr>
                    <td>{if isset($song->id)} {$song->id} {/if}  </td>
                    <td>{if isset($song->artist)} {$song->artist} {/if}</td>
                    <td>{if isset($song->track)} {$song->track} {/if}</td>
                    <td>
                        {if isset($song->link)} 
                            <a href="{$song->link}">{$song->link}</a>
                        {/if}
                    </td>
                    <td><a href="/songs/deletesong/{$song->id}">delete</a></td>
                    <td><a href="/songs/editsong/{$song->id}">edit</a></td>
                </tr>
            {/foreach}
            </tbody>
        </table>
    </div>
</div>

{/block}
