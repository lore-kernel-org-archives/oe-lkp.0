Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67AB314D1F
	for <oe-lkp@lists.linux.dev>; Mon,  2 Mar 2026 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772489305; cv=pass; b=Y9gXREd4TQWwAj+3DWuV9ESjgNQ2XwDrck0xaJEXjSfPIPId1iE7tfMCqtLwj05eL1St3NsJzd4sKbM5US2LNvVnwFovH8/RbcuLeZ3Uu7YN9RdgoWSosbw8LJ5MdIkGD8rXFMO7jIcWUeqLt20vaDOm5BX0TYX56vOkuW/mjrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772489305; c=relaxed/simple;
	bh=r2O5jCx9eFUMIeIyiCPXu4OyaJgtFSzs3phokLGOyv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uz9BuDOMWYkjWMHr7HUbrA7gm1o+lFqVBwwbPHu/BjsLWIwsaCQ0Ff2LV5mKdYwr489AdlLK4sD7EDQyVrgbfsrK0Uw1U6TX385esC7KnjObDYmnN0mfHkVolnZe0llZPeXIf6tEv5AHMyjDudujN+F/rsw9Nf7AcrXxJebh5QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QDMVQArW; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QDMVQArW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae3f822163so3815ad.0
        for <oe-lkp@lists.linux.dev>; Mon, 02 Mar 2026 14:08:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772489302; cv=none;
        d=google.com; s=arc-20240605;
        b=M+NJTrNIuqxA3bl2gzgo7nhB4xLsWMxAJEK0Ess9L/aLu1s4aPZ0CEk30h6vacGorA
         qOoJPPBTD1NVzBNhb3JPW2hzw5dYsaea0zpnb6yCJItO+mYWG6TcRmExhW5fgM14Z0hB
         NK/hR6EhOPOg57hYEBGsy4fMTIynmVcS3w76rMoeFomiAgpPPdy/b8v9fADxCt50TO+6
         hPwnLHMBbByZTfObxEN5N7ymJcZ3StYwx2d4PVIsA8iNGBC5aBTwRe1tQBSrHp04fPHk
         aClJYjkgqIkCp9YuWxkUSlz2MXvn8qiceYn186NcoHdQLvIxqBv8qFA/LwCVZuM8y+p5
         6FTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tqnejW2JMKRaRHVT6dQuDV+K1VSCbcKRUv0hLv8LpqY=;
        fh=AnRs4SS+1P17sCoS+PuPDWtNLiISUq6GX/9oXHzMn6Q=;
        b=g8IRbPLNK1lQvez9TnumB+Lir6dziC/lB2QyMVyH/gLVjjLOKo4cMa7lbVmh6R5ZH6
         4HFjFZo8pZdbUe3C0hocPRink/duhGHw7t390iwFTknx6fNn5wnznEOBjG4VMgVWRqb3
         OlPll4L9vsednrLQ7+lQ5cylAzL5T9pls0WhqczOxskEEOcFl4QKL/lGuqpVHcEHwHrA
         T+tfyIAxV97BFH+2pbDGuEQ06ko9rv14/g91nxV+5SlD3XchA320ziNJ9rm6OphJIes/
         agD823xaRjpZR3pxQq10XyZCK4xh2LbuX+Q4Fk9HTKF9brqq97qBBjKzDAmPgsZVd0cD
         yq9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772489302; x=1773094102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqnejW2JMKRaRHVT6dQuDV+K1VSCbcKRUv0hLv8LpqY=;
        b=QDMVQArWR48/xDJQzCVosnpxNUql/hJKOmgv8SBi72eVMeXpWWYY44lC2nOPvM3bD2
         A5XGl5iYna9HMZifKUls0Xa2DlFGa56yNu6sKVzE8hzIVj94PZ/i1Cxho2q0OuM0Sinv
         xxE3MVtPb53eT0eo+4LRghurrqHWOgVsd3bLWdYe7+3nKwv98JaCFtXP6eZfOSAIKCC4
         VSJhX5DquSMNnNmfEW77LoSIMaxyp8fps2hY/NXyfPXRzwBxxXl4ebgVpebzm7DY4ock
         VE7doIYCuBxTYAjwN8okEWsGXFTTV92nqbEZLq/GEB26lgx8uWiyEC3hCa45mOuspmTP
         OEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772489302; x=1773094102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqnejW2JMKRaRHVT6dQuDV+K1VSCbcKRUv0hLv8LpqY=;
        b=DPDgznczht+ss1PfmpFbUPIPnYJyR9i//kiyzQ0A9eWfdg77D0Dv6RD5v7GEwv+E2j
         xmRiukmRdZ7cJxLxK6E8/45H7f7aOLYWsiQBeDHsp8nd1Y57yLQRmlCSj3dqUrIX5fOQ
         YA66WsyLFyBKMXAdDcUOIVWITeB0xFN4X3iv4k3HmeUw1VfhtD3KAieVyXItLtA+Z4QJ
         +11yD3KnQAtoQ2tlRt9XCTXekKsz/IwDr+44HmdTfYsfRNq/Y7VRyU0X2p+Z+MfPdlgd
         c/ENpcdGRzXV9KsnbiMQIjZ+9KVu7hgKJHhYCB3tnzAi9ZE6n/lEGZ8Xd7FH+t8g596T
         mIIA==
X-Forwarded-Encrypted: i=1; AJvYcCXKC5rL+LTPXyEpbHbbM4M4sJkXgzyVSrNyoZLhH4wfvgSn7yraV7T2XPowX4SwxbwvZkdGnRs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyrCxHbztqaJO7lbLcWpuhkmwJ1dcYVYQjh+RXlwQF4HUDAPcj
	ZfK9BoDJGLOQdEUn22egN5wj3u3kdlL9v+m+ei5GenoKZgzBodAQlKQLFPm0LTHKVp1b3sE7rV9
	zLoF99ulCDnt/ow+HqHOkIS6+Zw+Cc0XHP9qUgQ+Q
X-Gm-Gg: ATEYQzzcbWiPxtEe/vYNVsY8AER257GSM73Uv/MlHF2Mtu8VQbT/G6qExqpdeNfr8No
	3+Ro8ndKFVKnjzOYPB7k3/FE00crel43yb7ePgalYHJeBvdizIYFjAlUSz9UlhtSZegnBW29z3B
	RpwvAv5Fm67e/SQDsJSW1bOWKxQFcGMYTsyo6PX0OxeXv/3/3lDFxHgelsraYObiEMU2BFAtYd6
	CnisPW0+q9+rlW6v4O/3bEFjQ9PNBF5d/AAuyLeJ86ImFZ6u/t05o4ZntyRU8w714254lO4jtZB
	tAjDHkGij5df/JFZBxkOcUA4aqZUQqELlHDP
X-Received: by 2002:a17:902:d50e:b0:2a7:640c:834b with SMTP id
 d9443c01a7336-2ae39492c95mr5939835ad.0.1772489301431; Mon, 02 Mar 2026
 14:08:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602270932.50ed0a9f-lkp@intel.com> <aaIPHGMxrxkYsD0b@google.com>
In-Reply-To: <aaIPHGMxrxkYsD0b@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 2 Mar 2026 14:08:09 -0800
X-Gm-Features: AaiRm51x1Z09AdwKLz2yin7Q-sMW37OJ_vW2Yapp7tnWhkvDXpph6IHrTV37vDo
Message-ID: <CAP-5=fXpFrNOBR7XmVcD0fdZ20sDMmczCvpo=St0eaPBtwdk_g@mail.gmail.com>
Subject: Re: [linus:master] [perf test] c9cd0c7e52: perf-sanity-tests.python_profiling_with_jitdump.fail
To: Namhyung Kim <namhyung@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Pablo Galindo <pablogsal@gmail.com>, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 1:39=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Feb 27, 2026 at 04:42:59PM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> >
> > we failed to run this new added test. not sure if we miss any dependenc=
ies?
> >
> >
> > below is full report FYI.
> >
> >
> > kernel test robot noticed "perf-sanity-tests.python_profiling_with_jitd=
ump.fail" on:
> >
> > commit: c9cd0c7e529e80e9be79867d2ebb874f67dbc35e ("perf test: Add pytho=
n JIT dump test")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > in testcase: perf-sanity-tests
> > version:
> > with following parameters:
> >
> >       perf_compiler: clang
> >       group: group-02
> >
> >
> > config: x86_64-rhel-9.4-bpf
> > compiler: gcc-14
> > test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with=
 32G memory
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202602270932.50ed0a9f-lkp@inte=
l.com
>
> Looks like a reference leak to map during libdw unwinding.
>
> Ian, can you please take a look?
>
> Thanks,
> Namhyung
>
> >
> >
> > 2026-01-26 15:25:04 sudo ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0 /usr/=
src/linux-perf-x86_64-rhel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e=
/tools/perf/perf test 84 -v
> >  84: python profiling with jitdump                                   : =
Running (1 active)
> > --- start ---
> > test child forked, pid 12390
> > Run python with -Xperf_jit
> > [ perf record: Woken up 5 times to write data ]
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D12400=3D=3DERROR: AddressSanitizer: heap-use-after-free on addres=
s 0x50200002ba30 at pc 0x55c306993987 bp 0x7ffd98998720 sp 0x7ffd98998718
> > READ of size 8 at 0x50200002ba30 thread T0
> >     #0 0x55c306993986 in map__start util/map.h:54
> >     #1 0x55c306993cd0 in map__dso_map_ip util/map.h:110
> >     #2 0x55c3069b1ecb in unwind_entry util/machine.c:2950
> >     #3 0x55c306e4197b in unwind__get_entries util/unwind-libdw.c:321
> >     #4 0x55c3069b2398 in thread__resolve_callchain_unwind util/machine.=
c:2976
> >     #5 0x55c3069b24ec in __thread__resolve_callchain util/machine.c:300=
3
> >     #6 0x55c306987e78 in sample__for_each_callchain_node util/callchain=
.c:1808
> >     #7 0x55c3067d4ece in build_id__mark_dso_hit util/build-id.c:77
> >     #8 0x55c3062f7004 in process_sample_event /usr/src/perf_selftests-x=
86_64-rhel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/buil=
tin-record.c:1504
> >     #9 0x55c3069dbec3 in evlist__deliver_sample util/session.c:1259
> >     #10 0x55c3069dc425 in machines__deliver_event util/session.c:1299
> >     #11 0x55c3069de009 in perf_session__deliver_event util/session.c:13=
86
> >     #12 0x55c3069cb296 in ordered_events__deliver_event util/session.c:=
134
> >     #13 0x55c306a06aac in do_flush util/ordered-events.c:245
> >     #14 0x55c306a07951 in __ordered_events__flush util/ordered-events.c=
:324
> >     #15 0x55c306a07e62 in ordered_events__flush util/ordered-events.c:3=
42
> >     #16 0x55c3069d6863 in perf_event__process_finished_round util/sessi=
on.c:786
> >     #17 0x55c3069deb7e in perf_session__process_user_event util/session=
.c:1446
> >     #18 0x55c3069e190e in perf_session__process_event util/session.c:16=
68
> >     #19 0x55c3069e9198 in process_simple util/session.c:2259
> >     #20 0x55c3069e8158 in reader__read_event util/session.c:2188
> >     #21 0x55c3069e8afe in reader__process_events util/session.c:2237
> >     #22 0x55c3069e9987 in __perf_session__process_events util/session.c=
:2282
> >     #23 0x55c3069eca43 in perf_session__process_events util/session.c:2=
446
> >     #24 0x55c3062f7328 in process_buildids /usr/src/perf_selftests-x86_=
64-rhel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/builtin=
-record.c:1534
> >     #25 0x55c3062fbdf0 in record__finish_output /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/bu=
iltin-record.c:1858
> >     #26 0x55c306309ebf in __cmd_record /usr/src/perf_selftests-x86_64-r=
hel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/builtin-rec=
ord.c:2930
> >     #27 0x55c306317a8f in cmd_record /usr/src/perf_selftests-x86_64-rhe=
l-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/builtin-recor=
d.c:4417
> >     #28 0x55c30652bf7b in run_builtin /usr/src/perf_selftests-x86_64-rh=
el-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/perf.c:349
> >     #29 0x55c30652c86c in handle_internal_command /usr/src/perf_selftes=
ts-x86_64-rhel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/=
perf.c:401
> >     #30 0x55c30652cdc2 in run_argv /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/perf.c:445
> >     #31 0x55c30652d569 in main /usr/src/perf_selftests-x86_64-rhel-9.4-=
bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/perf.c:553
> >     #32 0x7f026b873ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (Buil=
dId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
> >     #33 0x7f026b873d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc=
.so.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
> >     #34 0x55c306293210 in _start (/usr/src/perf_selftests-x86_64-rhel-9=
.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/perf+0x1023210) =
(BuildId: 47c1eede4a6cf8e0c379d2104e8b035638daa1b4)
> >
> > 0x50200002ba30 is located 0 bytes inside of 8-byte region [0x50200002ba=
30,0x50200002ba38)
> > freed by thread T0 here:
> >     #0 0x7f0275b3d8f8 in free ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:52
> >     #1 0x55c3069ba258 in map__put util/map.c:312
> >     #2 0x55c30679b7f8 in __map__zput util/map.h:198
> >     #3 0x55c30679c0df in addr_location__exit util/addr_location.c:31
> >     #4 0x55c306e3f7fe in entry util/unwind-libdw.c:147

This free is happening here (note I've set the commit to be that in
the report here):
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/unwind-libdw.c?h=3Dperf-tools-next&id=3Dc9cd0c7e529e=
80e9be79867d2ebb874f67dbc35e#n147
```
static int entry(u64 ip, struct unwind_info *ui)
{
struct unwind_entry *e =3D &ui->entries[ui->idx++];
struct addr_location al;

addr_location__init(&al);
if (__report_module(&al, ip, ui)) {
addr_location__exit(&al);
return -1;
}

e->ip   =3D ip;
e->ms.maps =3D al.maps;
e->ms.map =3D al.map;
e->ms.sym =3D al.sym;

pr_debug("unwind: %s:ip =3D 0x%" PRIx64 " (0x%" PRIx64 ")\n",
al.sym ? al.sym->name : "''",
ip,
al.map ? map__map_ip(al.map, ip) : (u64) 0);
addr_location__exit(&al);  // <-- free happens here
return 0;
}
```

This was fixed by the first of my unwind-libdw changes:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/commit/tools/perf/util/unwind-libdw.c?h=3Dperf-tools-next&id=3Df815fc0c66=
e777c727689666cfb46b8d461c2f99

That is the new test exposed a latent bug, which we've already fixed,
with a "fixes" tag for backports.

Thanks,
Ian

> >     #5 0x55c306e40b1b in frame_callback util/unwind-libdw.c:259
> >     #6 0x7f02758daae2 in dwfl_thread_getframes (/lib/x86_64-linux-gnu/l=
ibdw.so.1+0x78ae2) (BuildId: bafe9cb5bbbe6cee778d0d137730ea5c223d553e)
> >     #7 0x7f02758dae53 in dwfl_getthread_frames (/lib/x86_64-linux-gnu/l=
ibdw.so.1+0x78e53) (BuildId: bafe9cb5bbbe6cee778d0d137730ea5c223d553e)
> >     #8 0x55c306e414af in unwind__get_entries util/unwind-libdw.c:307
> >     #9 0x55c3069b2398 in thread__resolve_callchain_unwind util/machine.=
c:2976
> >     #10 0x55c3069b24ec in __thread__resolve_callchain util/machine.c:30=
03
> >     #11 0x55c306987e78 in sample__for_each_callchain_node util/callchai=
n.c:1808
> >     #12 0x55c3067d4ece in build_id__mark_dso_hit util/build-id.c:77
> >     #13 0x55c3062f7004 in process_sample_event /usr/src/perf_selftests-=
x86_64-rhel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/bui=
ltin-record.c:1504
> >     #14 0x55c3069dbec3 in evlist__deliver_sample util/session.c:1259
> >     #15 0x55c3069dc425 in machines__deliver_event util/session.c:1299
> >     #16 0x55c3069de009 in perf_session__deliver_event util/session.c:13=
86
> >     #17 0x55c3069cb296 in ordered_events__deliver_event util/session.c:=
134
> >     #18 0x55c306a06aac in do_flush util/ordered-events.c:245
> >     #19 0x55c306a07951 in __ordered_events__flush util/ordered-events.c=
:324
> >     #20 0x55c306a07e62 in ordered_events__flush util/ordered-events.c:3=
42
> >     #21 0x55c3069d6863 in perf_event__process_finished_round util/sessi=
on.c:786
> >     #22 0x55c3069deb7e in perf_session__process_user_event util/session=
.c:1446
> >     #23 0x55c3069e190e in perf_session__process_event util/session.c:16=
68
> >     #24 0x55c3069e9198 in process_simple util/session.c:2259
> >     #25 0x55c3069e8158 in reader__read_event util/session.c:2188
> >     #26 0x55c3069e8afe in reader__process_events util/session.c:2237
> >     #27 0x55c3069e9987 in __perf_session__process_events util/session.c=
:2282
> >
> > previously allocated by thread T0 here:
> >     #0 0x7f0275b3ec57 in malloc ../../../../src/libsanitizer/asan/asan_=
malloc_linux.cpp:69
> >     #1 0x55c3069bd747 in map__get util/map.h:188
> >     #2 0x55c3069c72c4 in maps__find util/maps.c:1112
> >     #3 0x55c30683b979 in thread__find_map util/event.c:687
> >     #4 0x55c30683be37 in thread__find_symbol util/event.c:723
> >     #5 0x55c306e3e7c3 in __report_module util/unwind-libdw.c:54
> >     #6 0x55c306e3f428 in entry util/unwind-libdw.c:133
> >     #7 0x55c306e40b1b in frame_callback util/unwind-libdw.c:259
> >     #8 0x7f02758daae2 in dwfl_thread_getframes (/lib/x86_64-linux-gnu/l=
ibdw.so.1+0x78ae2) (BuildId: bafe9cb5bbbe6cee778d0d137730ea5c223d553e)
> >     #9 0x7f02758dae53 in dwfl_getthread_frames (/lib/x86_64-linux-gnu/l=
ibdw.so.1+0x78e53) (BuildId: bafe9cb5bbbe6cee778d0d137730ea5c223d553e)
> >     #10 0x55c306e414af in unwind__get_entries util/unwind-libdw.c:307
> >     #11 0x55c3069b2398 in thread__resolve_callchain_unwind util/machine=
.c:2976
> >     #12 0x55c3069b24ec in __thread__resolve_callchain util/machine.c:30=
03
> >     #13 0x55c306987e78 in sample__for_each_callchain_node util/callchai=
n.c:1808
> >     #14 0x55c3067d4ece in build_id__mark_dso_hit util/build-id.c:77
> >     #15 0x55c3062f7004 in process_sample_event /usr/src/perf_selftests-=
x86_64-rhel-9.4-bpf-c9cd0c7e529e80e9be79867d2ebb874f67dbc35e/tools/perf/bui=
ltin-record.c:1504
> >     #16 0x55c3069dbec3 in evlist__deliver_sample util/session.c:1259
> >     #17 0x55c3069dc425 in machines__deliver_event util/session.c:1299
> >     #18 0x55c3069de009 in perf_session__deliver_event util/session.c:13=
86
> >     #19 0x55c3069cb296 in ordered_events__deliver_event util/session.c:=
134
> >     #20 0x55c306a06aac in do_flush util/ordered-events.c:245
> >     #21 0x55c306a07951 in __ordered_events__flush util/ordered-events.c=
:324
> >     #22 0x55c306a07e62 in ordered_events__flush util/ordered-events.c:3=
42
> >     #23 0x55c3069d6863 in perf_event__process_finished_round util/sessi=
on.c:786
> >     #24 0x55c3069deb7e in perf_session__process_user_event util/session=
.c:1446
> >     #25 0x55c3069e190e in perf_session__process_event util/session.c:16=
68
> >     #26 0x55c3069e9198 in process_simple util/session.c:2259
> >     #27 0x55c3069e8158 in reader__read_event util/session.c:2188
> >
> > SUMMARY: AddressSanitizer: heap-use-after-free util/map.h:54 in map__st=
art
> > Shadow bytes around the buggy address:
> >   0x50200002b780: fa fa fd fa fa fa fd fd fa fa 00 06 fa fa 00 fa
> >   0x50200002b800: fa fa 00 fa fa fa fd fa fa fa 00 fa fa fa 00 fa
> >   0x50200002b880: fa fa 00 fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x50200002b900: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x50200002b980: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fa
> > =3D>0x50200002ba00: fa fa fd fa fa fa[fd]fa fa fa fd fa fa fa fd fa
> >   0x50200002ba80: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x50200002bb00: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x50200002bb80: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x50200002bc00: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x50200002bc80: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > Shadow byte legend (one shadow byte represents 8 application bytes):
> >   Addressable:           00
> >   Partially addressable: 01 02 03 04 05 06 07
> >   Heap left redzone:       fa
> >   Freed heap region:       fd
> >   Stack left redzone:      f1
> >   Stack mid redzone:       f2
> >   Stack right redzone:     f3
> >   Stack after return:      f5
> >   Stack use after scope:   f8
> >   Global redzone:          f9
> >   Global init order:       f6
> >   Poisoned by user:        f7
> >   Container overflow:      fc
> >   Array cookie:            ac
> >   Intra object redzone:    bb
> >   ASan internal:           fe
> >   Left alloca redzone:     ca
> >   Right alloca redzone:    cb
> > =3D=3D12400=3D=3DABORTING
> > Error:
> > failed to process sample
> > Generate JIT-ed DSOs using perf inject
> > WARNING: The /tmp/__perf_test.perf.data.W1jHYt file's data size field i=
s 0 which is unexpected.
> > Was the 'perf record' command properly terminated?
> > Add JIT-ed DSOs to the build-ID cache
> > Couldn't add /tmp/jitted--*.so: No such file or directory
> > Check the symbol containing the function/module name
> > zero-sized data (/tmp/__perf_test.perf.data.W1jHYt.jit), nothing to do!
> > Found 0 matching lines
> > Remove JIT-ed DSOs from the build-ID cache
> > Cleaning up files...
> > ---- end(-1) ----
> >  84: python profiling with jitdump                                   : =
FAILED!
> >
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20260227/202602270932.50ed0a9f-=
lkp@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
