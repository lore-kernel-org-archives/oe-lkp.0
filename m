Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825FB1E3DED
	for <oe-lkp@lists.linux.dev>; Fri, 13 Jun 2025 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831388; cv=none; b=pqmc9dIq1fX24P0cEb0lD31eblSwsqpPaC4qYUAjzTi7A7LQkGsPyxKQpv8lEA+wOq1pdGYMW+Jhv8SAG/brfACCj9oM7zX396TDJLQjmdv2Q+6rY0qZQfMPGMn9/BovvOzssunVhl59hTjptwiYulJAAIDTd96Inv5ci9wZfF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831388; c=relaxed/simple;
	bh=ZNNpiRmkgQK4oR4F1G7PDW15jDWHn/ulM0hbB5/DJ+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gc4gCKfrk7XpTmYwrBI2cayWrCXo9xfU/IseV9dYk1CdsMqlZRGZYZgEXwL15UnPICJJi4eoCNjMExdcBt1bCYbF2zLMWpoDriegw6Tzeb0VDVJ62Hwfcjgm9Xqnjup8nXls9awP0qnE4x9j7TjWm6AzA8d4JAP8NUSB4zpPoBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmui/KO2; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmui/KO2"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e3e0415a7so22662907b3.0
        for <oe-lkp@lists.linux.dev>; Fri, 13 Jun 2025 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749831385; x=1750436185; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shtQ31qt06IwsR1ZMo31fL+HFRJcJB0fu4GgqVpmkPo=;
        b=lmui/KO2Yz3rwysnjGHFPXeOYdqD/HaYcxno5Mu2Lo1NNWOr9+kUy80B5++J7p99W9
         5IC+UjyRqSsJhrK8vZWW2mQ1Aj3aUmty6dAGm+LHr5NPFJK2lRstzX8WEMOzQPTC2Vb2
         +pdcs7iwcC7IRyTb8kiRLfXWRMhDw4zm7iFYgZK8VFtC8lxDsMpgsq878xaZc9w6XA1J
         lW1TdrysMu8oESuYFvQLyak+PsS81xGlWJpb5IqArl8zuIZShYxVDN8rP4h6WK06yiKB
         rUsQgMa2cZFZZFUwa8W9CzQBF+yZYg/bX1NaZdra1vq9IxEJm4dP7q5LGKy4ATFCk2p2
         Gwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831385; x=1750436185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shtQ31qt06IwsR1ZMo31fL+HFRJcJB0fu4GgqVpmkPo=;
        b=IWMnrYALY0jhldZ215++NNjBiQtSfeHJey1jIPAHRtTtwdLA60OGkgq0J6iKIrHmFE
         v3FtkNX5v1ewWRxkxubcsnztdYHtCxMVas755lbiJUQDInE+BB6x0r1QD1WgGdKDQ43L
         Rp5Rvw6K20x+BwJiSlA8b/RP4KN2EaSZ40CHcGFXqwuBdryumg+dptQiOobipCVPmDbQ
         12GqGb7Yw89cc3pWembbFWuU3yga2jBzls4Jkckm9HrF74fu3baV8GGVxk4n+7fhUq2t
         cskCnsILqZbH5vhPyGcVtBDldHQDT+/SMnMyvuJRN1FRLM4ZxaEEFB0PMIZSLi7lyLUY
         44Og==
X-Gm-Message-State: AOJu0YzP/d4Cmy9IpYl/+WETFhntJg4MtU6E8exuyQ7LdnzTna+Pk/OZ
	WR3tcDoxQwTvipuz3P/KwGaYtKML2lOEocX7cM0FUCufdWk5oL4W5DSbZjCgd26shYyFXaOIs96
	ynG4VzzUvzntybV4ouaGXBqk72f4gZ1c=
X-Gm-Gg: ASbGncsD/HELfnSlg/0gp72QjVxMd/doB+wbo9YMYIAAENWmOeSSBxEpnlIHqfH6yYx
	sc959QMd1FtgxJpkpUwfA7e9Vibj/AgKjVWLIJOjvHCf7/TmlR1ygQZ4xdMs3xBRkmO0jT3ERYl
	eMiPvOzzyDdr+Negr6BLXMnkfNXeuUEzmhZwB+Qu35ng==
X-Google-Smtp-Source: AGHT+IH8KRO5NAvpOV0B710syFcRppWyEcfkkGyYilcXfnkd40EY4k0WKyLJ84ku9Df2F0oMV65SDnroAE30ZbfmsK0=
X-Received: by 2002:a05:690c:7105:b0:710:e81e:1364 with SMTP id
 00721157ae682-71174831507mr5115987b3.6.1749831385405; Fri, 13 Jun 2025
 09:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528191148.89118-6-howardchu95@gmail.com> <202506131634.ef8ef10b-lkp@intel.com>
In-Reply-To: <202506131634.ef8ef10b-lkp@intel.com>
From: Howard Chu <howardchu95@gmail.com>
Date: Fri, 13 Jun 2025 09:16:12 -0700
X-Gm-Features: AX0GCFuPd9g_8EyYpHzUKWhhwGkbelEd9StxOrKONofjY15gj3p97SeL907_bds
Message-ID: <CAH0uvoiF0OYWd9fB7_XxwK_pScYASnTNGssv2ABp1xcdz=+1nA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] perf test trace BTF: Use --sort-events in BTF
 general tests
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acme@kernel.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	peterz@infradead.org, kan.liang@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 2:41=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
> Hello,
>
> besides below formal report, we observed below difference comparing to pa=
rent.
>
> 1d2859b4fa79a8e2 609a86901e6fd886f1139aed8f8
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     kmsg.sanitizer.direct_leak/=
__interceptor_malloc/alloc_event/ordered_events__new_event/ordered_events__=
queue/trace__deliver_event/trace__run
>            :6          100%           6:6     kmsg.sanitizer.direct_leak/=
__interceptor_malloc/thread__get/trace__sys_enter/trace__handle_event/__tra=
ce__deliver_event/ordered_events__deliver_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/nsinfo__alloc/nsinfo__copy/map__new/machine__process=
_mmap2_event/machine__process_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/zalloc/comm__new/thread__new/threads__findnew/__mach=
ine__findnew_thread
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/zalloc/dso__new_id/__dsos__addnew_id/__dsos__findnew=
_id/dsos__findnew_id
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/zalloc/dso__new_id/dso__new/__machine__addnew_vdso/m=
achine__findnew_vdso
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/zalloc/map__new/machine__process_mmap2_event/machine=
__process_event/trace__process_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/zalloc/maps__new/thread__init_maps/__machine__findne=
w_thread/machine__findnew_thread
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/zalloc/thread__new/threads__findnew/__machine__findn=
ew_thread/machine__findnew_thread
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_calloc/zalloc/thread_trace__new/thread__trace/trace__sys_en=
ter/trace__handle_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/comm_str__get/comm_strs__findnew/comm__override/____=
thread__set_comm/__thread__set_comm
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/dso__get/map__init/map__new/machine__process_mmap2_e=
vent/machine__process_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/map__get/__maps__insert_sorted/__maps__fixup_overlap=
_and_insert/maps__fixup_overlap_and_insert/thread__insert_map
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/maps__new/thread__init_maps/__machine__findnew_threa=
d/machine__findnew_thread/machine__process_comm_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/nsinfo__alloc/nsinfo__copy/map__new/machine__process=
_mmap2_event/machine__process_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/nsinfo__alloc/nsinfo__new/thread__new/threads__findn=
ew/__machine__findnew_thread
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/nsinfo__get/map__new/machine__process_mmap2_event/ma=
chine__process_event/trace__process_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_malloc/trace__sys_enter/trace__handle_event/__trace__delive=
r_event/ordered_events__deliver_event/do_flush
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_realloc/__maps__insert_sorted/__maps__fixup_overlap_and_ins=
ert/maps__fixup_overlap_and_insert/thread__insert_map/machine__process_mmap=
2_event
>            :6          100%           6:6     kmsg.sanitizer.indirect_lea=
k/__interceptor_strdup/dso__set_basename/__dsos__addnew_id/__dsos__findnew_=
id/dsos__findnew_id/machine__findnew_dso_id
>
>
> we don't have enough knowledge whether the appearance of these leak messa=
ge is
> actually a fix from 609a86901e6fd886f1139aed8f8 which allows to show issu=
e
> clearly. so just report out FYI.
>
> below is formal report.
>
>
> kernel test robot noticed "kmsg.sanitizer.indirect_leak/__interceptor_mal=
loc/trace__sys_enter/trace__handle_event/__trace__deliver_event/ordered_eve=
nts__deliver_event/do_flush" on:
>
> commit: 609a86901e6fd886f1139aed8f8c66d982f2afed ("[PATCH v3 5/6] perf te=
st trace BTF: Use --sort-events in BTF general tests")
> url: https://github.com/intel-lab-lkp/linux/commits/Howard-Chu/perf-test-=
trace-Use-shell-s-f-flag-to-check-if-vmlinux-exists/20250529-031444
> patch link: https://lore.kernel.org/all/20250528191148.89118-6-howardchu9=
5@gmail.com/
> patch subject: [PATCH v3 5/6] perf test trace BTF: Use --sort-events in B=
TF general tests

Definitely because of --sort-event, option coverage is important. Will
fix it, thanks bot.
