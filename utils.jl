function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

# Custom code
function hfun_episodetable()
  episode_dir = "episodes/"
  episode_files = readdir(episode_dir)
  table_str = """
  | Guests | Title | Video | Audio |
  | --- | --- | --- | --- |
  """
  for filename in episode_files
    full_filename = episode_dir * filename
    table_str *= "| {{fill guest $full_filename}} " *
                 "| {{fill title $full_filename}} " *
                 "| [video]({{fill youtube $full_filename}}) " *
                 "| [audio]({{fill spotify $full_filename}}) " *
                 "|\n"
  end
  return html(html2(table_str, cur_lc()))
end
