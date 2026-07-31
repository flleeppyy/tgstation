// Wrappers for BYOND default procs which can't directly be called by call().

/proc/_abs(A)
	procstart = null
	src.procstart = null
	return abs(A)

/proc/_animate(atom/target, set_vars, time = 10, loop = 1, easing = LINEAR_EASING, flags = null)
	procstart = null
	src.procstart = null
	if(target)
		animate(target, appearance = set_vars, time, loop, easing, flags)
	else
		animate(appearance = set_vars, time, easing = easing, flags)

/proc/_arccos(A)
	procstart = null
	src.procstart = null
	return arccos(A)

/proc/_arcsin(A)
	procstart = null
	src.procstart = null
	return arcsin(A)

/proc/_ascii2text(A)
	procstart = null
	src.procstart = null
	return ascii2text(A)

/proc/_block(Start, End)
	procstart = null
	src.procstart = null
	return block(Start, End)

/proc/_ckey(Key)
	procstart = null
	src.procstart = null
	return ckey(Key)

/proc/_ckeyEx(Key)
	procstart = null
	src.procstart = null
	return ckeyEx(Key)

/proc/_copytext(T, Start = 1, End = 0)
	procstart = null
	src.procstart = null
	return copytext(T, Start, End)

/proc/_cos(X)
	procstart = null
	src.procstart = null
	return cos(X)

/proc/_findtext(Haystack, Needle, Start = 1, End = 0)
	procstart = null
	src.procstart = null
	return findtext(Haystack, Needle, Start, End)

/proc/_findtextEx(Haystack, Needle, Start = 1, End = 0)
	procstart = null
	src.procstart = null
	return findtextEx(Haystack, Needle, Start, End)

/proc/_flick(Icon, Object)
	procstart = null
	src.procstart = null
	flick(Icon, Object)

/proc/_get_dir(Loc1, Loc2)
	procstart = null
	src.procstart = null
	return get_dir(Loc1, Loc2)

/proc/_get_dist(Loc1, Loc2)
	procstart = null
	src.procstart = null
	return get_dist(Loc1, Loc2)

/proc/_get_step(Ref, Dir)
	procstart = null
	src.procstart = null
	return get_step(Ref, Dir)

/proc/_hascall(object, procname)
	procstart = null
	src.procstart = null
	return hascall(object, procname)

/proc/_hearers(Depth = world.view, Center = usr)
	procstart = null
	src.procstart = null
	return hearers(Depth, Center)

/proc/_image(icon, loc, icon_state, layer, dir)
	procstart = null
	src.procstart = null
	return image(icon, loc, icon_state, layer, dir)

/proc/_istype(object, type)
	procstart = null
	src.procstart = null
	return istype(object, type)

/proc/_ispath(path, type)
	procstart = null
	src.procstart = null
	if(isnull(type))
		return ispath(path)
	return ispath(path, type)

/proc/_length(E)
	procstart = null
	src.procstart = null
	return length(E)

/proc/_link(thing, url)
	procstart = null
	src.procstart = null
	thing << link(url)

/proc/_locate(X, Y, Z)
	procstart = null
	src.procstart = null
	if (isnull(Y)) // Assuming that it's only a single-argument call.
		// direct ref locate
		var/datum/D = locate(X)
		// &&'s to last value
		return istype(D) && D.can_vv_mark() && D

	return locate(X, Y, Z)

/proc/_log(X, Y)
	procstart = null
	src.procstart = null
	return log(X, Y)

/proc/_uppertext(T)
	procstart = null
	src.procstart = null
	return uppertext(T)

/proc/_LOWER_TEXT(T)
	procstart = null
	src.procstart = null
	return LOWER_TEXT(T)

/proc/_matrix(a, b, c, d, e, f)
	procstart = null
	src.procstart = null
	return matrix(a, b, c, d, e, f)

/proc/_max(...)
	procstart = null
	src.procstart = null
	return max(arglist(args))

/proc/_md5(T)
	procstart = null
	src.procstart = null
	return md5(T)

/proc/_min(...)
	procstart = null
	src.procstart = null
	return min(arglist(args))

/proc/_new(type, arguments)
	procstart = null
	src.procstart = null
	var/datum/result

	if(!length(arguments))
		result = new type()
	else
		result = new type(arglist(arguments))

	if(istype(result))
		result.datum_flags |= DF_VAR_EDITED
	return result

/proc/_num2text(N, SigFig = 6)
	procstart = null
	src.procstart = null
	return num2text(N, SigFig)

/proc/_text2num(T)
	procstart = null
	src.procstart = null
	return text2num(T)

/proc/_ohearers(Dist, Center = usr)
	procstart = null
	src.procstart = null
	return ohearers(Dist, Center)

/proc/_orange(Dist, Center = usr)
	procstart = null
	src.procstart = null
	return orange(Dist, Center)

/proc/_output(thing, msg, control)
	procstart = null
	src.procstart = null
	thing << output(msg, control)

/proc/_oview(Dist, Center = usr)
	procstart = null
	src.procstart = null
	return oview(Dist, Center)

/proc/_oviewers(Dist, Center = usr)
	procstart = null
	src.procstart = null
	return oviewers(Dist, Center)

/proc/_params2list(Params)
	procstart = null
	src.procstart = null
	return params2list(Params)

/proc/_pick(...)
	procstart = null
	src.procstart = null
	return pick(arglist(args))

/// Allow me to explain
/// for some reason, if pick() is passed arglist(args) directly and args contains only one list
/// it considers it to be a list of lists
/// this means something like _pick(list) would fail
/// need to do this instead
///
/// I hate this timeline
/proc/_pick_list(list/pick_from)
	procstart = null
	src.procstart = null
	return pick(pick_from)

/proc/_prob(P)
	procstart = null
	src.procstart = null
	return prob(P)

/proc/_rand(L = 0, H = 1)
	procstart = null
	src.procstart = null
	return rand(L, H)

/proc/_range(Dist, Center = usr)
	procstart = null
	src.procstart = null
	return range(Dist, Center)

/proc/_rect_turfs(H_Radius = 0, V_Radius = 0, atom/Center)
	procstart = null
	src.procstart = null
	return RECT_TURFS(H_Radius, V_Radius, Center)

/proc/_regex(pattern, flags)
	procstart = null
	src.procstart = null
	return regex(pattern, flags)

/proc/_REGEX_QUOTE(text)
	procstart = null
	src.procstart = null
	return REGEX_QUOTE(text)

/proc/_REGEX_QUOTE_REPLACEMENT(text)
	procstart = null
	src.procstart = null
	return REGEX_QUOTE_REPLACEMENT(text)

/proc/_replacetext(Haystack, Needle, Replacement, Start = 1,End = 0)
	procstart = null
	src.procstart = null
	return replacetext(Haystack, Needle, Replacement, Start, End)

/proc/_replacetextEx(Haystack, Needle, Replacement, Start = 1,End = 0)
	procstart = null
	src.procstart = null
	return replacetextEx(Haystack, Needle, Replacement, Start, End)

/proc/_rgb(R, G, B)
	procstart = null
	src.procstart = null
	return rgb(R, G, B)

/proc/_rgba(R, G, B, A)
	procstart = null
	src.procstart = null
	return rgb(R, G, B, A)

/proc/_roll(dice)
	procstart = null
	src.procstart = null
	return roll(dice)

/proc/_round(A, B = 1)
	procstart = null
	src.procstart = null
	return round(A, B)

/proc/_sin(X)
	procstart = null
	src.procstart = null
	return sin(X)

/proc/_list_add(list/L, ...)
	procstart = null
	src.procstart = null
	if (args.len < 2)
		return
	L += args.Copy(2)

/proc/_list_copy(list/L, Start = 1, End = 0)
	procstart = null
	src.procstart = null
	return L.Copy(Start, End)

/proc/_list_cut(list/L, Start = 1, End = 0)
	procstart = null
	src.procstart = null
	L.Cut(Start, End)

/proc/_list_find(list/L, Elem, Start = 1, End = 0)
	procstart = null
	src.procstart = null
	return L.Find(Elem, Start, End)

/proc/_list_insert(list/L, Index, Item)
	procstart = null
	src.procstart = null
	return L.Insert(Index, Item)

/proc/_list_join(list/L, Glue, Start = 0, End = 1)
	procstart = null
	src.procstart = null
	return L.Join(Glue, Start, End)

/proc/_list_remove(list/L, ...)
	procstart = null
	src.procstart = null
	if (args.len < 2)
		return
	L -= args.Copy(2)

/proc/_list_set(list/L, key, value)
	procstart = null
	src.procstart = null
	L[key] = value

/proc/_list_get(list/L, key)
	procstart = null
	src.procstart = null
	return L[key]

/proc/_list_numerical_add(L, key, num)
	procstart = null
	src.procstart = null
	L[key] += num

/proc/_list_swap(list/L, Index1, Index2)
	procstart = null
	src.procstart = null
	L.Swap(Index1, Index2)

/proc/_walk(ref, dir, lag)
	procstart = null
	src.procstart = null
	walk(ref, dir, lag)

/proc/_walk_towards(ref, trg, lag)
	procstart = null
	src.procstart = null
	walk_towards(ref, trg, lag)

/proc/_walk_to(ref, trg, min, lag)
	procstart = null
	src.procstart = null
	walk_to(ref, trg, min, lag)

/proc/_walk_away(ref, trg, max, lag)
	procstart = null
	src.procstart = null
	walk_away(ref, trg, max, lag)

/proc/_walk_rand(ref, lag)
	procstart = null
	src.procstart = null
	walk_rand(ref, lag)

/proc/_step(ref, dir)
	procstart = null
	src.procstart = null
	step(ref, dir)

/proc/_step_rand(ref)
	procstart = null
	src.procstart = null
	step_rand(ref)

/proc/_step_to(ref, trg, min)
	procstart = null
	src.procstart = null
	step_to(ref, trg, min)

/proc/_step_towards(ref, trg)
	procstart = null
	src.procstart = null
	step_towards(ref, trg)

/proc/_step_away(ref, trg, max)
	procstart = null
	src.procstart = null
	step_away(ref, trg, max)

/proc/_has_trait(datum/thing, trait)
	procstart = null
	src.procstart = null
	return HAS_TRAIT(thing, trait)

/proc/_add_trait(datum/thing, trait, source)
	procstart = null
	src.procstart = null
	ADD_TRAIT(thing, trait, source)

/proc/_remove_trait(datum/thing, trait, source)
	procstart = null
	src.procstart = null
	REMOVE_TRAIT(thing, trait, source)

/proc/_winset(player, control_id, params)
	procstart = null
	src.procstart = null
	winset(player, control_id, params)

/proc/_winget(player, control_id, params)
	procstart = null
	src.procstart = null
	return winget(player, control_id, params)

/proc/_text2path(text)
	procstart = null
	src.procstart = null
	return text2path(text)

/proc/_turn(dir, angle)
	procstart = null
	src.procstart = null
	return turn(dir, angle)

/proc/_view(Dist, Center = usr)
	procstart = null
	src.procstart = null
	return view(Dist, Center)

/proc/_viewers(Dist, Center = usr)
	procstart = null
	src.procstart = null
	return viewers(Dist, Center)

/proc/_generator(type = "num", A = 0, B = 1, rand = UNIFORM_RAND)
	procstart = null
	src.procstart = null
	return generator(type, A, B, rand)

/// Auxtools REALLY doesn't know how to handle filters as values;
/// when passed as arguments to auxtools-called procs, they aren't simply treated as nulls -
/// they don't even count towards the length of args.
/// For example, calling some_proc([a filter], foo, bar) from auxtools
/// is equivalent to calling some_proc(foo, bar). Thus, we can't use _animate directly on filters.
/// Use this to perform animation steps on a filter. Consecutive steps on the same filter can be
/// achieved by calling _animate with no target.
/proc/_animate_filter(atom/target, filter_index, set_vars, time = 10, loop = 1, easing = LINEAR_EASING, flags = null)
	procstart = null
	src.procstart = null
	if(!istype(target))
		return
	if(!filter_index || filter_index < 1 || filter_index > length(target.filters))
		return
	animate(target.filters[filter_index], appearance = set_vars, time, loop, easing, flags)

/proc/_is_type_in_typecache(thing_to_check, typecache)
	procstart = null
	src.procstart = null
	return is_type_in_typecache(thing_to_check, typecache)

/proc/_floor(a)
	procstart = null
	src.procstart = null
	return floor(a)

/proc/_ceil(a)
	procstart = null
	src.procstart = null
	return ceil(a)

/proc/_typesof(a, subtypes_only = FALSE)
	procstart = null
	src.procstart = null
	. = typesof(a)
	if(subtypes_only)
		. -= a

/proc/_html_encode(text)
	procstart = null
	src.procstart = null
	return html_encode(text)

/proc/_html_decode(text)
	procstart = null
	src.procstart = null
	return html_decode(text)

/proc/_url_encode(text)
	procstart = null
	src.procstart = null
	return url_encode(text)

/proc/_url_decode(text)
	procstart = null
	src.procstart = null
	return url_decode(text)
