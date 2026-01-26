Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623733A71F
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 17:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447595; cv=pass; b=J4hqYwbNkk3qdhtCTG5s3N0RS9K5YyMAZUJjvGojSDmY+7PenT5AE5niQKSUopmXnpB9y8j9SnO8sLhlybSKGwyzDPL0DDhlUdxPqn09wugryUvYpcpCnun4TgO4WzzKssiyn/ozyhXFtv2/cl8bVb8Oagc3kh39aTAnz9owFHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447595; c=relaxed/simple;
	bh=JAm/kCUXLLxD2nQoiSJdd8W5QyGGc7uj3QIJdk1zLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ho8AqjPgi9uc58mh9DHqgxPzEQJPGEtYb3hBznUCZV++11SsjM5DgmI//6EMlf1HV4FcdHzCqJ7F2bR6iRGGcpmpdrf9h59eVeUzFrmeut2W2ZpSC3tXdMCvBbhFjlsAz67mHzDBrbT+X+PymUcHVxILieTbIkw7jF5aX3i0w/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BEwgWHkc; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BEwgWHkc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a35ae38bdfso161905ad.1
        for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 09:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769447591; cv=none;
        d=google.com; s=arc-20240605;
        b=JOxR+SMzboIEv7ET+iFu4Ex6MMCcJN1ZK/TXqi9XyENZwhbd1qEiZPbz3XKUREshPL
         6zrckNIiwIb1MhykfS6PdbbPZ6b36NA6DbWz/cM8fP9YawwtD8HFNzFOC7UpnE4xGiR4
         GHpewbqRVlAC5PdaCqgphj9tLgaa1UxlClJo/45mwPEisN+7JBdWP/Igr0EW72w4um02
         MYGXB7mHTxMsjQGxFbC1NHAGFY0SemZf0vX7PBRaeMfGDjIDLeVTAfl7wAFaAxLW4WVk
         Hw0NNTj7dg3kqBuu1NaqHW0PjY1Sbb2JffdiRPAfI4rDKQwBIWnfiS08H25Qztmg7YQC
         trFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JUpcYEy+BtvtQdOomotBMJNDC5GCncgjNudyBNYHNO0=;
        fh=WuqAjEXhRvRl7kvaqdSccOjaKd63G+2C1g7va+727C4=;
        b=g5f4t9sz6PaXH/SVg1HGSfnVn9vC1L9pqy739AOWpPouWSHrrLLY2NGWNpXNR7GnuE
         vtd73sDWyOI1wut/v4QUVzGZHeIqNNWLfh34cViNsUS4wR7aNzxjypPrsUWOmPHt3F7r
         4dzg5QajM05SCjlG0xNR99s/Ywc6v7JJ2IfIioqr64YOox/3mt6uDgi2r8/bH2E4O3jz
         7dGGTxsfjNx4H+aVcMWFQHF9uESPWjxn4+d/PWX6C42luMq0zHX6W1tuuhDpzVVV5WGn
         Xnbu6wnxcCaOzBzVGJRQzyzwtlBxaWaE6qU13SnBfVUozgC37txtwLCmW5iz2+RRzpzk
         kYzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769447591; x=1770052391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUpcYEy+BtvtQdOomotBMJNDC5GCncgjNudyBNYHNO0=;
        b=BEwgWHkcUkWyBJsPUUIoSvxsFYoUc95TxFk8luqC+Twh4JvJx8n8CsyLlaHigroDvz
         m9MnIdzVK7RbY+fovEk4HU/lF4nAs9aZH5o4Z8Nbq+mdNYQERrNxGDl8KgsVcHwsjVIo
         wCO8YPs/kE+LMRZvmqBSybwTPlLeb30ZltejBZnaFwJ+fqjo5wRzVmta709+WbhuBs37
         lbrNtHU/S5JpT0zVXnVQvStjy9GxSQa108QPrer+n+fRf+8soCMGKqvu4F7UzV+WWZGP
         bMo9Ws7sw4pQU+kRzr/b9wcOQh3gA3CDtVQo4sAPyozrR7NeJ3/a5zvoDo1aa9Z6Ergg
         0t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769447591; x=1770052391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUpcYEy+BtvtQdOomotBMJNDC5GCncgjNudyBNYHNO0=;
        b=ndDW2cs4Y7pAzy62IFMZFHK8bI31/w4MEilRuw5ikXnsHfBbdHTfjvZpvAO83Qy5Dh
         TjPrlpRZOK4a/cfP2COsed8gEgFoDwXZRRkEJYe3ztnntjh48FY6WzoyjhlkQfMFjY8b
         7FlqRrD2sT8An9pNn5W/Y9rNS2I62eOczLP5OwAHVHBFPT0KhZ6yuclKGOgmlNaH5zXI
         iM16ND7moCBP6v1LCaQGcYgdtV48VxwYdGyIcVna9wB4A9ngsIofkc6wUudByo8qyhaH
         AjTWGuVt01C/F5sOTgwy66yLtMpGzstpSUB5CPiHYJ2qCW2LMBUq75So6h4oEn5tnKJc
         EdfA==
X-Forwarded-Encrypted: i=1; AJvYcCXQKOqzFsMDtaOwZUhFMPE530ylBUUw7c+6ycPJZUdSD1rsWnUeTt82BN0WtsDBN44lmQXgXnw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3bOcEQVSeTPNzvHvyYHc1HvHnQUTTINKotmj9Snt8VJlg3Bej
	6ARCLECE2/pg/IZzYTtRsVw7aejsGddwmId2qKTpQx2Lv0YdadVPLNoqL+HYE4lpZUiC8xtqzZ0
	ssou4DZjBX/gZBGpdUf5+uNpgl7BvAd7Cwx+AtT8w
X-Gm-Gg: AZuq6aKrYtpyMNZwszEIWL1yxbVTr9FP7oPJ1y7bsbGACGP1Q0sXvRAdVEAXzFwfMW+
	BCPhKy143FcEwHnzkA3sNkB+1C+roK81b4ooOkcRKi3YzuEG4/2K0EAc/UwA+1HrtxZoYrxJ/TR
	6BqJsWcps3Mb+13LbSmrU/bCJxfS20hmxdktwop9hv0ai2SL5MNKIiC+a98i7iaICYqS4wAl+Ex
	6wN0GsO7p0jb8h8aSRzCJEgw/GBNTpZpYQOUMMjwC8DKC+q/JAdc2aWMbn0xUDhw3peAUCFfe8T
	mGsGKslhNQUto6QALfwKHGRgeg==
X-Received: by 2002:a17:902:ef09:b0:2a0:89b0:71d7 with SMTP id
 d9443c01a7336-2a844e77f45mr2203475ad.13.1769447590255; Mon, 26 Jan 2026
 09:13:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119175833.340369-3-swapnil.sapkal@amd.com> <202601262235.ee84b79e-lkp@intel.com>
In-Reply-To: <202601262235.ee84b79e-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 26 Jan 2026 09:12:58 -0800
X-Gm-Features: AZwV_Qh4lqp6pOS6_4XbMeZAmqv0N3DtcyFZGtbL6e3fH1LSMYLaj2Yl-jc01us
Message-ID: <CAP-5=fXU9XcyFRv_zbjsg7HLr8S6BLjvNiwkF-a+Fv_78+16-A@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] perf header: Support CPU DOMAIN relation info
To: kernel test robot <oliver.sang@intel.com>
Cc: Swapnil Sapkal <swapnil.sapkal@amd.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	james.clark@arm.com, ravi.bangoria@amd.com, yu.c.chen@intel.com, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	rostedt@goodmis.org, vincent.guittot@linaro.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, gautham.shenoy@amd.com, kprateek.nayak@amd.com, 
	juri.lelli@redhat.com, yangjihong@bytedance.com, void@manifault.com, 
	tj@kernel.org, sshegde@linux.ibm.com, ctshao@google.com, 
	quic_zhonhan@quicinc.com, thomas.falcon@intel.com, blakejones@google.com, 
	ashelat@redhat.com, leo.yan@arm.com, dvyukov@google.com, ak@linux.intel.com, 
	yujie.liu@intel.com, graham.woodward@arm.com, ben.gainey@arm.com, 
	vineethr@linux.ibm.com, tim.c.chen@linux.intel.com, linux@treblig.org, 
	santosh.shukla@amd.com, sandipan.das@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 6:47=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "kmsg.sanitizer.direct_leak/calloc/zalloc/proce=
ss_cpu_domain_info/perf_file_section__process/perf_header__process_sections=
/perf_session__read_header" on:
>
> commit: 6f993818d20c79b874f546cec1dcce40a9927c7b ("[PATCH v5 02/10] perf =
header: Support CPU DOMAIN relation info")
> url: https://github.com/intel-lab-lkp/linux/commits/Swapnil-Sapkal/tools-=
lib-Add-list_is_first/20260120-021007
> base: https://git.kernel.org/cgit/linux/kernel/git/perf/perf-tools-next.g=
it perf-tools-next
> patch link: https://lore.kernel.org/all/20260119175833.340369-3-swapnil.s=
apkal@amd.com/
> patch subject: [PATCH v5 02/10] perf header: Support CPU DOMAIN relation =
info
>
> in testcase: perf-sanity-tests
> version:
> with following parameters:
>
>         perf_compiler: gcc
>         group: group-02
>
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-14
> test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emer=
ald Rapids) with 256G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202601262235.ee84b79e-lkp@intel.=
com

As always thanks for the testing! I believe this issue is addressed by:
https://lore.kernel.org/lkml/20260122213516.671089-2-irogers@google.com/
which is merged into the perf-tools-next tree:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/commit/?h=3Dperf-tools-next&id=3Dd84f24c898864facc13412a58b78964f6a769d76

Thanks,
Ian

> we found below tests impacted.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/perf_compiler/group:
>   lkp-emr-2sp1/perf-sanity-tests/debian-13-x86_64-20250902.cgz/x86_64-rhe=
l-9.4-bpf/gcc-14/gcc/group-02
>
> 4d991caa3f1e36c3 6f993818d20c79b874f546cec1d
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     perf-sanity-tests.build_id_=
cache_operations.fail
>            :6          100%           6:6     perf-sanity-tests.perf_evli=
st_tests.fail
>            :6          100%           6:6     perf-sanity-tests.perf_head=
er_tests.fail
>
>
>
>
> 2026-01-24 13:53:34 sudo ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0 /usr/sr=
c/linux-perf-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/t=
ools/perf/perf test 80 -v
>  80: build id cache operations                                       : Ru=
nning (1 active)
> --- start ---
> test child forked, pid 14171
> WARNING: perf not built with libbfd. PE binaries will not be tested.
> WARNING: wine not found. PE binaries will not be run.
> test binaries: /tmp/perf_buildid_test.ex.SHA1.fdj /tmp/perf_buildid_test.=
ex.MD5.U8m /usr/src/perf_selftests-x86_64-rhel-9.4-bpf-6f993818d20c79b874f5=
46cec1dcce40a9927c7b/tools/perf/tests/shell/../pe-file.exe
> DEBUGINFOD_URLS=3D
> Downloading debug info with build id 89e03056b3c150ac13d49ad72e7ccfe9e8e1=
fb11
> Adding 89e03056b3c150ac13d49ad72e7ccfe9e8e1fb11 /tmp/perf_buildid_test.ex=
.SHA1.fdj: Ok
> build id: 89e03056b3c150ac13d49ad72e7ccfe9e8e1fb11
> link: /tmp/perf_buildid_test.debug.PIE/.build-id/89/e03056b3c150ac13d49ad=
72e7ccfe9e8e1fb11
> file: /tmp/perf_buildid_test.debug.PIE/.build-id/89/../../tmp/perf_buildi=
d_test.ex.SHA1.fdj/89e03056b3c150ac13d49ad72e7ccfe9e8e1fb11/elf
> OK for /tmp/perf_buildid_test.ex.SHA1.fdj
> DEBUGINFOD_URLS=3D
> Downloading debug info with build id ee26502b2cb816e82d08fd203ebf46b4
> Adding ee26502b2cb816e82d08fd203ebf46b4 /tmp/perf_buildid_test.ex.MD5.U8m=
: Ok
> build id: ee26502b2cb816e82d08fd203ebf46b4
> link: /tmp/perf_buildid_test.debug.dem/.build-id/ee/26502b2cb816e82d08fd2=
03ebf46b4
> file: /tmp/perf_buildid_test.debug.dem/.build-id/ee/../../tmp/perf_buildi=
d_test.ex.MD5.U8m/ee26502b2cb816e82d08fd203ebf46b4/elf
> OK for /tmp/perf_buildid_test.ex.MD5.U8m
> running: perf record /tmp/perf_buildid_test.ex.SHA1.fdj
> build id: 89e03056b3c150ac13d49ad72e7ccfe9e8e1fb11
> link: /tmp/perf_buildid_test.debug.T5w/.build-id/89/e03056b3c150ac13d49ad=
72e7ccfe9e8e1fb11
> file: /tmp/perf_buildid_test.debug.T5w/.build-id/89/../../tmp/perf_buildi=
d_test.ex.SHA1.fdj/89e03056b3c150ac13d49ad72e7ccfe9e8e1fb11/elf
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D14272=3D=3DERROR: LeakSanitizer: detected memory leaks
>
> Direct leak of 131072 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3a7fd98c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x563053942c76 in do_read_string util/header.c:261
>     #2 0x563053967c30 in process_cpu_domain_info util/header.c:3653
>     #3 0x56305396f9f3 in perf_file_section__process util/header.c:4386
>     #4 0x56305396cfb5 in perf_header__process_sections util/header.c:4144
>     #5 0x563053971ef1 in perf_session__read_header util/header.c:4620
>     #6 0x5630539cd802 in perf_session__open util/session.c:54
>     #7 0x5630539cea98 in __perf_session__new util/session.c:168
>     #8 0x5630532b6d43 in perf_session__new util/session.h:116
>     #9 0x5630532b798b in perf_session__list_build_ids /usr/src/perf_selft=
ests-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/per=
f/builtin-buildid-list.c:113
>     #10 0x5630532b8891 in cmd_buildid_list /usr/src/perf_selftests-x86_64=
-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-b=
uildid-list.c:175
>     #11 0x5630535113bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x563053511b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x5630535120e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x563053512851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3a75ac0ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3a75ac0d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x563053277310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 73728 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3a7fd98610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x56305353dd0c in zalloc ../../lib/zalloc.c:8
>     #2 0x563053967c7f in process_cpu_domain_info util/header.c:3657
>     #3 0x56305396f9f3 in perf_file_section__process util/header.c:4386
>     #4 0x56305396cfb5 in perf_header__process_sections util/header.c:4144
>     #5 0x563053971ef1 in perf_session__read_header util/header.c:4620
>     #6 0x5630539cd802 in perf_session__open util/session.c:54
>     #7 0x5630539cea98 in __perf_session__new util/session.c:168
>     #8 0x5630532b6d43 in perf_session__new util/session.h:116
>     #9 0x5630532b798b in perf_session__list_build_ids /usr/src/perf_selft=
ests-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/per=
f/builtin-buildid-list.c:113
>     #10 0x5630532b8891 in cmd_buildid_list /usr/src/perf_selftests-x86_64=
-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-b=
uildid-list.c:175
>     #11 0x5630535113bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x563053511b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x5630535120e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x563053512851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3a75ac0ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3a75ac0d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x563053277310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3a7fd98c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x563053942c76 in do_read_string util/header.c:261
>     #2 0x563053967a1c in process_cpu_domain_info util/header.c:3642
>     #3 0x56305396f9f3 in perf_file_section__process util/header.c:4386
>     #4 0x56305396cfb5 in perf_header__process_sections util/header.c:4144
>     #5 0x563053971ef1 in perf_session__read_header util/header.c:4620
>     #6 0x5630539cd802 in perf_session__open util/session.c:54
>     #7 0x5630539cea98 in __perf_session__new util/session.c:168
>     #8 0x5630532b6d43 in perf_session__new util/session.h:116
>     #9 0x5630532b798b in perf_session__list_build_ids /usr/src/perf_selft=
ests-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/per=
f/builtin-buildid-list.c:113
>     #10 0x5630532b8891 in cmd_buildid_list /usr/src/perf_selftests-x86_64=
-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-b=
uildid-list.c:175
>     #11 0x5630535113bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x563053511b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x5630535120e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x563053512851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3a75ac0ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3a75ac0d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x563053277310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3a7fd98c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x563053942c76 in do_read_string util/header.c:261
>     #2 0x563053967e44 in process_cpu_domain_info util/header.c:3662
>     #3 0x56305396f9f3 in perf_file_section__process util/header.c:4386
>     #4 0x56305396cfb5 in perf_header__process_sections util/header.c:4144
>     #5 0x563053971ef1 in perf_session__read_header util/header.c:4620
>     #6 0x5630539cd802 in perf_session__open util/session.c:54
>     #7 0x5630539cea98 in __perf_session__new util/session.c:168
>     #8 0x5630532b6d43 in perf_session__new util/session.h:116
>     #9 0x5630532b798b in perf_session__list_build_ids /usr/src/perf_selft=
ests-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/per=
f/builtin-buildid-list.c:113
>     #10 0x5630532b8891 in cmd_buildid_list /usr/src/perf_selftests-x86_64=
-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-b=
uildid-list.c:175
>     #11 0x5630535113bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x563053511b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x5630535120e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x563053512851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3a75ac0ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3a75ac0d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x563053277310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 10532 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3a7fd98610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x56305353dd0c in zalloc ../../lib/zalloc.c:8
>     #2 0x563053967e93 in process_cpu_domain_info util/header.c:3666
>     #3 0x56305396f9f3 in perf_file_section__process util/header.c:4386
>     #4 0x56305396cfb5 in perf_header__process_sections util/header.c:4144
>     #5 0x563053971ef1 in perf_session__read_header util/header.c:4620
>     #6 0x5630539cd802 in perf_session__open util/session.c:54
>     #7 0x5630539cea98 in __perf_session__new util/session.c:168
>     #8 0x5630532b6d43 in perf_session__new util/session.h:116
>     #9 0x5630532b798b in perf_session__list_build_ids /usr/src/perf_selft=
ests-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/per=
f/builtin-buildid-list.c:113
>     #10 0x5630532b8891 in cmd_buildid_list /usr/src/perf_selftests-x86_64=
-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-b=
uildid-list.c:175
>     #11 0x5630535113bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x563053511b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x5630535120e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x563053512851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3a75ac0ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3a75ac0d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x563053277310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 4352 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3a7fd98610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x56305353dd0c in zalloc ../../lib/zalloc.c:8
>     #2 0x563053967a6b in process_cpu_domain_info util/header.c:3646
>     #3 0x56305396f9f3 in perf_file_section__process util/header.c:4386
>     #4 0x56305396cfb5 in perf_header__process_sections util/header.c:4144
>     #5 0x563053971ef1 in perf_session__read_header util/header.c:4620
>     #6 0x5630539cd802 in perf_session__open util/session.c:54
>     #7 0x5630539cea98 in __perf_session__new util/session.c:168
>     #8 0x5630532b6d43 in perf_session__new util/session.h:116
>     #9 0x5630532b798b in perf_session__list_build_ids /usr/src/perf_selft=
ests-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/per=
f/builtin-buildid-list.c:113
>     #10 0x5630532b8891 in cmd_buildid_list /usr/src/perf_selftests-x86_64=
-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-b=
uildid-list.c:175
>     #11 0x5630535113bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x563053511b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x5630535120e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x563053512851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3a75ac0ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3a75ac0d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x563053277310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> SUMMARY: AddressSanitizer: 350756 byte(s) leaked in 6144 allocation(s).
> failed: 89e03056b3c150ac13d49ad72e7ccfe9e8e1fb11 is not reported by "perf=
 buildid-list -i /tmp/perf_buildid_test.data.9pp"
> Unexpected signal in check
> ---- end(-1) ----
>  80: build id cache operations                                       : FA=
ILED!
>
>
> ...
>
>
> 2026-01-24 13:55:59 sudo ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0 /usr/sr=
c/linux-perf-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/t=
ools/perf/perf test 85 -v
>  85: perf evlist tests                                               : Ru=
nning (1 active)
> --- start ---
> test child forked, pid 15479
> Simple evlist test
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D15499=3D=3DERROR: LeakSanitizer: detected memory leaks
>
> Direct leak of 131072 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3c9bf85c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x55c6557f9c76 in do_read_string util/header.c:261
>     #2 0x55c65581ec30 in process_cpu_domain_info util/header.c:3653
>     #3 0x55c6558269f3 in perf_file_section__process util/header.c:4386
>     #4 0x55c655823fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55c655828ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55c655884802 in perf_session__open util/session.c:54
>     #7 0x55c655885a98 in __perf_session__new util/session.c:168
>     #8 0x55c6551528d3 in perf_session__new util/session.h:116
>     #9 0x55c655152d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x55c655153e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x55c6553c83bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x55c6553c8b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x55c6553c90e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x55c6553c9851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3c91cadca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3c91cadd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x55c65512e310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 73728 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3c9bf85610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x55c6553f4d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x55c65581ec7f in process_cpu_domain_info util/header.c:3657
>     #3 0x55c6558269f3 in perf_file_section__process util/header.c:4386
>     #4 0x55c655823fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55c655828ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55c655884802 in perf_session__open util/session.c:54
>     #7 0x55c655885a98 in __perf_session__new util/session.c:168
>     #8 0x55c6551528d3 in perf_session__new util/session.h:116
>     #9 0x55c655152d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x55c655153e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x55c6553c83bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x55c6553c8b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x55c6553c90e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x55c6553c9851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3c91cadca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3c91cadd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x55c65512e310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3c9bf85c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x55c6557f9c76 in do_read_string util/header.c:261
>     #2 0x55c65581ea1c in process_cpu_domain_info util/header.c:3642
>     #3 0x55c6558269f3 in perf_file_section__process util/header.c:4386
>     #4 0x55c655823fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55c655828ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55c655884802 in perf_session__open util/session.c:54
>     #7 0x55c655885a98 in __perf_session__new util/session.c:168
>     #8 0x55c6551528d3 in perf_session__new util/session.h:116
>     #9 0x55c655152d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x55c655153e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x55c6553c83bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x55c6553c8b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x55c6553c90e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x55c6553c9851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3c91cadca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3c91cadd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x55c65512e310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3c9bf85c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x55c6557f9c76 in do_read_string util/header.c:261
>     #2 0x55c65581ee44 in process_cpu_domain_info util/header.c:3662
>     #3 0x55c6558269f3 in perf_file_section__process util/header.c:4386
>     #4 0x55c655823fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55c655828ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55c655884802 in perf_session__open util/session.c:54
>     #7 0x55c655885a98 in __perf_session__new util/session.c:168
>     #8 0x55c6551528d3 in perf_session__new util/session.h:116
>     #9 0x55c655152d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x55c655153e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x55c6553c83bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x55c6553c8b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x55c6553c90e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x55c6553c9851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3c91cadca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3c91cadd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x55c65512e310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 10532 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3c9bf85610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x55c6553f4d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x55c65581ee93 in process_cpu_domain_info util/header.c:3666
>     #3 0x55c6558269f3 in perf_file_section__process util/header.c:4386
>     #4 0x55c655823fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55c655828ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55c655884802 in perf_session__open util/session.c:54
>     #7 0x55c655885a98 in __perf_session__new util/session.c:168
>     #8 0x55c6551528d3 in perf_session__new util/session.h:116
>     #9 0x55c655152d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x55c655153e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x55c6553c83bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x55c6553c8b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x55c6553c90e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x55c6553c9851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3c91cadca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3c91cadd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x55c65512e310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 4352 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f3c9bf85610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x55c6553f4d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x55c65581ea6b in process_cpu_domain_info util/header.c:3646
>     #3 0x55c6558269f3 in perf_file_section__process util/header.c:4386
>     #4 0x55c655823fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55c655828ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55c655884802 in perf_session__open util/session.c:54
>     #7 0x55c655885a98 in __perf_session__new util/session.c:168
>     #8 0x55c6551528d3 in perf_session__new util/session.h:116
>     #9 0x55c655152d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x55c655153e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x55c6553c83bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x55c6553c8b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x55c6553c90e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x55c6553c9851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f3c91cadca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f3c91cadd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x55c65512e310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> SUMMARY: AddressSanitizer: 350756 byte(s) leaked in 6144 allocation(s).
> Simple evlist [Failed to list event]
> Group evlist test
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D15528=3D=3DERROR: LeakSanitizer: detected memory leaks
>
> Direct leak of 131072 byte(s) in 1024 object(s) allocated from:
>     #0 0x7efcde5dfc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x56040444bc76 in do_read_string util/header.c:261
>     #2 0x560404470c30 in process_cpu_domain_info util/header.c:3653
>     #3 0x5604044789f3 in perf_file_section__process util/header.c:4386
>     #4 0x560404475fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x56040447aef1 in perf_session__read_header util/header.c:4620
>     #6 0x5604044d6802 in perf_session__open util/session.c:54
>     #7 0x5604044d7a98 in __perf_session__new util/session.c:168
>     #8 0x560403da48d3 in perf_session__new util/session.h:116
>     #9 0x560403da4d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x560403da5e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x56040401a3bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x56040401ab8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x56040401b0e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x56040401b851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7efcd4307ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7efcd4307d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x560403d80310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 73728 byte(s) in 1024 object(s) allocated from:
>     #0 0x7efcde5df610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x560404046d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x560404470c7f in process_cpu_domain_info util/header.c:3657
>     #3 0x5604044789f3 in perf_file_section__process util/header.c:4386
>     #4 0x560404475fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x56040447aef1 in perf_session__read_header util/header.c:4620
>     #6 0x5604044d6802 in perf_session__open util/session.c:54
>     #7 0x5604044d7a98 in __perf_session__new util/session.c:168
>     #8 0x560403da48d3 in perf_session__new util/session.h:116
>     #9 0x560403da4d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x560403da5e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x56040401a3bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x56040401ab8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x56040401b0e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x56040401b851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7efcd4307ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7efcd4307d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x560403d80310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7efcde5dfc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x56040444bc76 in do_read_string util/header.c:261
>     #2 0x560404470a1c in process_cpu_domain_info util/header.c:3642
>     #3 0x5604044789f3 in perf_file_section__process util/header.c:4386
>     #4 0x560404475fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x56040447aef1 in perf_session__read_header util/header.c:4620
>     #6 0x5604044d6802 in perf_session__open util/session.c:54
>     #7 0x5604044d7a98 in __perf_session__new util/session.c:168
>     #8 0x560403da48d3 in perf_session__new util/session.h:116
>     #9 0x560403da4d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x560403da5e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x56040401a3bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x56040401ab8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x56040401b0e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x56040401b851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7efcd4307ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7efcd4307d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x560403d80310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7efcde5dfc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x56040444bc76 in do_read_string util/header.c:261
>     #2 0x560404470e44 in process_cpu_domain_info util/header.c:3662
>     #3 0x5604044789f3 in perf_file_section__process util/header.c:4386
>     #4 0x560404475fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x56040447aef1 in perf_session__read_header util/header.c:4620
>     #6 0x5604044d6802 in perf_session__open util/session.c:54
>     #7 0x5604044d7a98 in __perf_session__new util/session.c:168
>     #8 0x560403da48d3 in perf_session__new util/session.h:116
>     #9 0x560403da4d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x560403da5e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x56040401a3bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x56040401ab8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x56040401b0e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x56040401b851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7efcd4307ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7efcd4307d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x560403d80310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 10532 byte(s) in 1024 object(s) allocated from:
>     #0 0x7efcde5df610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x560404046d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x560404470e93 in process_cpu_domain_info util/header.c:3666
>     #3 0x5604044789f3 in perf_file_section__process util/header.c:4386
>     #4 0x560404475fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x56040447aef1 in perf_session__read_header util/header.c:4620
>     #6 0x5604044d6802 in perf_session__open util/session.c:54
>     #7 0x5604044d7a98 in __perf_session__new util/session.c:168
>     #8 0x560403da48d3 in perf_session__new util/session.h:116
>     #9 0x560403da4d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x560403da5e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x56040401a3bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x56040401ab8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x56040401b0e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x56040401b851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7efcd4307ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7efcd4307d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x560403d80310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 4352 byte(s) in 1024 object(s) allocated from:
>     #0 0x7efcde5df610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x560404046d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x560404470a6b in process_cpu_domain_info util/header.c:3646
>     #3 0x5604044789f3 in perf_file_section__process util/header.c:4386
>     #4 0x560404475fb5 in perf_header__process_sections util/header.c:4144
>     #5 0x56040447aef1 in perf_session__read_header util/header.c:4620
>     #6 0x5604044d6802 in perf_session__open util/session.c:54
>     #7 0x5604044d7a98 in __perf_session__new util/session.c:168
>     #8 0x560403da48d3 in perf_session__new util/session.h:116
>     #9 0x560403da4d1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x560403da5e1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x56040401a3bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x56040401ab8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x56040401b0e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x56040401b851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7efcd4307ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7efcd4307d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x560403d80310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> SUMMARY: AddressSanitizer: 350756 byte(s) leaked in 6144 allocation(s).
> Group evlist [Failed to list event group]
> Event configuration evlist test
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D15547=3D=3DERROR: LeakSanitizer: detected memory leaks
>
> Direct leak of 131072 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f6169abfc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x559f7b345c76 in do_read_string util/header.c:261
>     #2 0x559f7b36ac30 in process_cpu_domain_info util/header.c:3653
>     #3 0x559f7b3729f3 in perf_file_section__process util/header.c:4386
>     #4 0x559f7b36ffb5 in perf_header__process_sections util/header.c:4144
>     #5 0x559f7b374ef1 in perf_session__read_header util/header.c:4620
>     #6 0x559f7b3d0802 in perf_session__open util/session.c:54
>     #7 0x559f7b3d1a98 in __perf_session__new util/session.c:168
>     #8 0x559f7ac9e8d3 in perf_session__new util/session.h:116
>     #9 0x559f7ac9ed1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x559f7ac9fe1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x559f7af143bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x559f7af14b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x559f7af150e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x559f7af15851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f615f7e7ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f615f7e7d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x559f7ac7a310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 73728 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f6169abf610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x559f7af40d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x559f7b36ac7f in process_cpu_domain_info util/header.c:3657
>     #3 0x559f7b3729f3 in perf_file_section__process util/header.c:4386
>     #4 0x559f7b36ffb5 in perf_header__process_sections util/header.c:4144
>     #5 0x559f7b374ef1 in perf_session__read_header util/header.c:4620
>     #6 0x559f7b3d0802 in perf_session__open util/session.c:54
>     #7 0x559f7b3d1a98 in __perf_session__new util/session.c:168
>     #8 0x559f7ac9e8d3 in perf_session__new util/session.h:116
>     #9 0x559f7ac9ed1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x559f7ac9fe1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x559f7af143bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x559f7af14b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x559f7af150e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x559f7af15851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f615f7e7ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f615f7e7d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x559f7ac7a310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f6169abfc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x559f7b345c76 in do_read_string util/header.c:261
>     #2 0x559f7b36aa1c in process_cpu_domain_info util/header.c:3642
>     #3 0x559f7b3729f3 in perf_file_section__process util/header.c:4386
>     #4 0x559f7b36ffb5 in perf_header__process_sections util/header.c:4144
>     #5 0x559f7b374ef1 in perf_session__read_header util/header.c:4620
>     #6 0x559f7b3d0802 in perf_session__open util/session.c:54
>     #7 0x559f7b3d1a98 in __perf_session__new util/session.c:168
>     #8 0x559f7ac9e8d3 in perf_session__new util/session.h:116
>     #9 0x559f7ac9ed1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x559f7ac9fe1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x559f7af143bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x559f7af14b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x559f7af150e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x559f7af15851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f615f7e7ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f615f7e7d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x559f7ac7a310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f6169abfc57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x559f7b345c76 in do_read_string util/header.c:261
>     #2 0x559f7b36ae44 in process_cpu_domain_info util/header.c:3662
>     #3 0x559f7b3729f3 in perf_file_section__process util/header.c:4386
>     #4 0x559f7b36ffb5 in perf_header__process_sections util/header.c:4144
>     #5 0x559f7b374ef1 in perf_session__read_header util/header.c:4620
>     #6 0x559f7b3d0802 in perf_session__open util/session.c:54
>     #7 0x559f7b3d1a98 in __perf_session__new util/session.c:168
>     #8 0x559f7ac9e8d3 in perf_session__new util/session.h:116
>     #9 0x559f7ac9ed1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x559f7ac9fe1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x559f7af143bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x559f7af14b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x559f7af150e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x559f7af15851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f615f7e7ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f615f7e7d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x559f7ac7a310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 10532 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f6169abf610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x559f7af40d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x559f7b36ae93 in process_cpu_domain_info util/header.c:3666
>     #3 0x559f7b3729f3 in perf_file_section__process util/header.c:4386
>     #4 0x559f7b36ffb5 in perf_header__process_sections util/header.c:4144
>     #5 0x559f7b374ef1 in perf_session__read_header util/header.c:4620
>     #6 0x559f7b3d0802 in perf_session__open util/session.c:54
>     #7 0x559f7b3d1a98 in __perf_session__new util/session.c:168
>     #8 0x559f7ac9e8d3 in perf_session__new util/session.h:116
>     #9 0x559f7ac9ed1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x559f7ac9fe1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x559f7af143bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x559f7af14b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x559f7af150e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x559f7af15851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f615f7e7ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f615f7e7d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x559f7ac7a310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 4352 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f6169abf610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x559f7af40d0c in zalloc ../../lib/zalloc.c:8
>     #2 0x559f7b36aa6b in process_cpu_domain_info util/header.c:3646
>     #3 0x559f7b3729f3 in perf_file_section__process util/header.c:4386
>     #4 0x559f7b36ffb5 in perf_header__process_sections util/header.c:4144
>     #5 0x559f7b374ef1 in perf_session__read_header util/header.c:4620
>     #6 0x559f7b3d0802 in perf_session__open util/session.c:54
>     #7 0x559f7b3d1a98 in __perf_session__new util/session.c:168
>     #8 0x559f7ac9e8d3 in perf_session__new util/session.h:116
>     #9 0x559f7ac9ed1f in __cmd_evlist /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist=
.c:46
>     #10 0x559f7ac9fe1a in cmd_evlist /usr/src/perf_selftests-x86_64-rhel-=
9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-evlist.=
c:101
>     #11 0x559f7af143bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #12 0x559f7af14b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #13 0x559f7af150e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #14 0x559f7af15851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #15 0x7f615f7e7ca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7f615f7e7d64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x559f7ac7a310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> SUMMARY: AddressSanitizer: 350756 byte(s) leaked in 6144 allocation(s).
> Event configuration evlist [Failed to list verbose info]
> ---- end(-1) ----
>  85: perf evlist tests                                               : FA=
ILED!
>
>
> ...
>
>
> 2026-01-24 13:56:27 sudo ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0 /usr/sr=
c/linux-perf-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/t=
ools/perf/perf test 87 -v
>  87: perf header tests                                               : Ru=
nning (1 active)
> --- start ---
> test child forked, pid 15636
> Test perf header file
> [ perf record: Woken up 2 times to write data ]
> [ perf record: Captured and wrote 0.213 MB /tmp/__perf_test_header.perf.d=
ata.LAgPK (4662 samples) ]
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D15661=3D=3DERROR: LeakSanitizer: detected memory leaks
>
> Direct leak of 131072 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f5bd6234c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x55684cf14c76 in do_read_string util/header.c:261
>     #2 0x55684cf39c30 in process_cpu_domain_info util/header.c:3653
>     #3 0x55684cf419f3 in perf_file_section__process util/header.c:4386
>     #4 0x55684cf3efb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55684cf43ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55684cf9f802 in perf_session__open util/session.c:54
>     #7 0x55684cfa0a98 in __perf_session__new util/session.c:168
>     #8 0x55684c8cf199 in perf_session__new util/session.h:116
>     #9 0x55684c8e5d65 in cmd_report /usr/src/perf_selftests-x86_64-rhel-9=
.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-report.c=
:1629
>     #10 0x55684cae33bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #11 0x55684cae3b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #12 0x55684cae40e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #13 0x55684cae4851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #14 0x7f5bcbf5cca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7f5bcbf5cd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x55684c849310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 73728 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f5bd6234610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x55684cb0fd0c in zalloc ../../lib/zalloc.c:8
>     #2 0x55684cf39c7f in process_cpu_domain_info util/header.c:3657
>     #3 0x55684cf419f3 in perf_file_section__process util/header.c:4386
>     #4 0x55684cf3efb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55684cf43ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55684cf9f802 in perf_session__open util/session.c:54
>     #7 0x55684cfa0a98 in __perf_session__new util/session.c:168
>     #8 0x55684c8cf199 in perf_session__new util/session.h:116
>     #9 0x55684c8e5d65 in cmd_report /usr/src/perf_selftests-x86_64-rhel-9=
.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-report.c=
:1629
>     #10 0x55684cae33bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #11 0x55684cae3b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #12 0x55684cae40e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #13 0x55684cae4851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #14 0x7f5bcbf5cca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7f5bcbf5cd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x55684c849310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f5bd6234c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x55684cf14c76 in do_read_string util/header.c:261
>     #2 0x55684cf39a1c in process_cpu_domain_info util/header.c:3642
>     #3 0x55684cf419f3 in perf_file_section__process util/header.c:4386
>     #4 0x55684cf3efb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55684cf43ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55684cf9f802 in perf_session__open util/session.c:54
>     #7 0x55684cfa0a98 in __perf_session__new util/session.c:168
>     #8 0x55684c8cf199 in perf_session__new util/session.h:116
>     #9 0x55684c8e5d65 in cmd_report /usr/src/perf_selftests-x86_64-rhel-9=
.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-report.c=
:1629
>     #10 0x55684cae33bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #11 0x55684cae3b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #12 0x55684cae40e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #13 0x55684cae4851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #14 0x7f5bcbf5cca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7f5bcbf5cd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x55684c849310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 65536 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f5bd6234c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x55684cf14c76 in do_read_string util/header.c:261
>     #2 0x55684cf39e44 in process_cpu_domain_info util/header.c:3662
>     #3 0x55684cf419f3 in perf_file_section__process util/header.c:4386
>     #4 0x55684cf3efb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55684cf43ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55684cf9f802 in perf_session__open util/session.c:54
>     #7 0x55684cfa0a98 in __perf_session__new util/session.c:168
>     #8 0x55684c8cf199 in perf_session__new util/session.h:116
>     #9 0x55684c8e5d65 in cmd_report /usr/src/perf_selftests-x86_64-rhel-9=
.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-report.c=
:1629
>     #10 0x55684cae33bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #11 0x55684cae3b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #12 0x55684cae40e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #13 0x55684cae4851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #14 0x7f5bcbf5cca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7f5bcbf5cd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x55684c849310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 10532 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f5bd6234610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x55684cb0fd0c in zalloc ../../lib/zalloc.c:8
>     #2 0x55684cf39e93 in process_cpu_domain_info util/header.c:3666
>     #3 0x55684cf419f3 in perf_file_section__process util/header.c:4386
>     #4 0x55684cf3efb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55684cf43ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55684cf9f802 in perf_session__open util/session.c:54
>     #7 0x55684cfa0a98 in __perf_session__new util/session.c:168
>     #8 0x55684c8cf199 in perf_session__new util/session.h:116
>     #9 0x55684c8e5d65 in cmd_report /usr/src/perf_selftests-x86_64-rhel-9=
.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-report.c=
:1629
>     #10 0x55684cae33bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #11 0x55684cae3b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #12 0x55684cae40e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #13 0x55684cae4851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #14 0x7f5bcbf5cca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7f5bcbf5cd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x55684c849310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> Direct leak of 4352 byte(s) in 1024 object(s) allocated from:
>     #0 0x7f5bd6234610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x55684cb0fd0c in zalloc ../../lib/zalloc.c:8
>     #2 0x55684cf39a6b in process_cpu_domain_info util/header.c:3646
>     #3 0x55684cf419f3 in perf_file_section__process util/header.c:4386
>     #4 0x55684cf3efb5 in perf_header__process_sections util/header.c:4144
>     #5 0x55684cf43ef1 in perf_session__read_header util/header.c:4620
>     #6 0x55684cf9f802 in perf_session__open util/session.c:54
>     #7 0x55684cfa0a98 in __perf_session__new util/session.c:168
>     #8 0x55684c8cf199 in perf_session__new util/session.h:116
>     #9 0x55684c8e5d65 in cmd_report /usr/src/perf_selftests-x86_64-rhel-9=
.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/builtin-report.c=
:1629
>     #10 0x55684cae33bf in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:348
>     #11 0x55684cae3b8f in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/pe=
rf.c:398
>     #12 0x55684cae40e5 in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:442
>     #13 0x55684cae4851 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf.c:549
>     #14 0x7f5bcbf5cca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7f5bcbf5cd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x55684c849310 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-6f993818d20c79b874f546cec1dcce40a9927c7b/tools/perf/perf+0x1048310) (B=
uildId: 07c75edf5764b1417259ec0a6cb5fc6de1859c88)
>
> SUMMARY: AddressSanitizer: 350756 byte(s) leaked in 6144 allocation(s).
> Unexpected signal in test_file
> ---- end(-1) ----
>  87: perf header tests                                               : FA=
ILED!
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260126/202601262235.ee84b79e-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
