Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E21CD22
	for <oe-lkp@lists.linux.dev>; Tue, 13 Feb 2024 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707851635; cv=none; b=Iv79YcXxzM3+AaGgE6Z+1rPGC5i4SK7AqaF6ubhW0TZ9Xx7UJFWCOqEWqlT2zLM+LxoDiupDVxLoOCOoA7bF8kVd5OQh1qHYK2IivaHUuIfCfFWdNv/GfJ8e84SjdIpccea/3aLre7r8ei3/YjEu7R88RfkHrJrbtO+NBzjqmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707851635; c=relaxed/simple;
	bh=rsk7gPMs4pCAq9FXpk/3ZWpNqzekIHKMuYgjeaBd3V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beVbuj59HGj9ll90JUCfOySzXgT3ikovGGriKu+28QTzbZGir0DmCh8db0JEmWFNeZmaxlb16zAkw3HeVMTavOCpnNq3slYR6vO1yr+vxy8NVZ9M/BlzWcEXteBxqZ6h3plKV3NlEalWmz+c7ZxHQRhV8n7WXIjQFSeO8kPiTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6usHdpa; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6usHdpa"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e2e452c852so1384618a34.3
        for <oe-lkp@lists.linux.dev>; Tue, 13 Feb 2024 11:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707851633; x=1708456433; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgwiYNmIqbIQowFOkt5Hr/Mc/qEeG+RVmCMkf+QqU7A=;
        b=j6usHdpaZWHvXe8wv2P4NoTn8zZ05hY8C2/B/zr+SpLWyifJVv9zTF1L3YPfaaAsK8
         R/sjrj3NPmSz8pqk2nknlnt4X1Z3LzEmRY6zKViMOHC0YWjbksCzaRQf/Cs+BfT5pUkC
         jNevZj9PVRh3TeL8uSTSYaIHpCaoDTmQ1Nos+EHQPKCAe93zYcB6667hRoIR0VUgvOth
         khxwfrNZ1IDGkg9SUX35iLdemIRHF+JdD9wmRJAEAfmPwjL136jnaG1+7REtRS7hRAO7
         t5Kx5SrIpDZpj+Le5I5Rp9/AfVByW/J7qQFBc6X0xXi2doJ/+Eb5tKvm5OsiYITaF3rg
         7YYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707851633; x=1708456433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgwiYNmIqbIQowFOkt5Hr/Mc/qEeG+RVmCMkf+QqU7A=;
        b=VWmushkjxEdCHP1b23g6VJWjHf9hb6aJYKU0mk/pCJW/3euXPxwum/HQkxh0cO5gfZ
         JxbJQ9ECK1qxsOwD+MdCViOPq4RkhgIfDTrW33q03DuyDUhFDBbHP+cpgqCz/ZkTsTyL
         xhEh5iednGJHOw+KqDlS/JLHmfbEopBmVfCTDBPHvWKU+kryUZAH+bKR3omlq8I4J8Sn
         IukEPPfWf9zC3rU/gmEE2z109+6KGDAfdAlZu5Vkkaxvy4p13MBKsREwzFrH45RRhwQF
         Jp8By9KI01PePp1/OmgR2P1gL9YvwfNofPS9MQJ6147S1ozvYoBDCtzta37U3eaRgCVJ
         txMA==
X-Gm-Message-State: AOJu0YzXQ0y1bIWPnuqbHuvO96ND00eEXHivnFUo0YQ76b+1D/JpKoIj
	Klgnz6OqwCEI2gyyWVQNSX1K/8TJT50rwLhGfspGejVc/A202u3fwiqM+++/LLcBjFVqcu9udZX
	47UA/Ok2cSn/OMKevDDN+4oQANRo=
X-Google-Smtp-Source: AGHT+IG6mNfyxmj56owJMfuuBqaHct2d2rwydQ+T5Y1IoE2NPt/DkI9yrNfNH+k4CNV9rcGKG2x84zT9XuJhH0u+v5I=
X-Received: by 2002:a05:6830:1e96:b0:6e2:b5e4:30d4 with SMTP id
 n22-20020a0568301e9600b006e2b5e430d4mr537446otr.26.1707851632850; Tue, 13 Feb
 2024 11:13:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402071553.75bfbe67-oliver.sang@intel.com> <CAOQ4uxghgvmSzN_twab00xyUh=+0UJ79_pn-tjW1Ob_s1-zroQ@mail.gmail.com>
 <ZcR+scdiyu7OZexO@xsang-OptiPlex-9020>
In-Reply-To: <ZcR+scdiyu7OZexO@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 13 Feb 2024 21:13:41 +0200
Message-ID: <CAOQ4uxiF=cr5w987WbOBqotWZfdFesHt+CpnoBD=DnxncLLJ8w@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fsnotify] 9c13a708ef:
 will-it-scale.per_thread_ops -4.2% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 9:12=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Amir,
>
> On Wed, Feb 07, 2024 at 11:17:36PM +0200, Amir Goldstein wrote:
> > On Wed, Feb 7, 2024 at 9:37=E2=80=AFAM kernel test robot <oliver.sang@i=
ntel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a -4.2% regression of will-it-scale.per_thr=
ead_ops on:
> > >
> > >
> > > commit: 9c13a708efa02450fb5a50fc02a6eaf060fa00a1 ("fsnotify: introduc=
e pre-content permission event")
> > > https://github.com/amir73il/linux sb_write_barrier
> > >
> > > testcase: will-it-scale
> > > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTD=
X (Sapphire Rapids) with 512G memory
> > > parameters:
> > >
> > >         test: writeseek1
> > >         cpufreq_governor: performance
> > >
> > >
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202402071553.75bfbe67-oliver=
.sang@intel.com
> > >
> > >
> > > Details are as below:
> > > ---------------------------------------------------------------------=
----------------------------->
> > >
> > >
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20240207/202402071553.75bfbe6=
7-oliver.sang@intel.com
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
> > >   gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/=
lkp-spr-2sp4/writeseek1/will-it-scale
> > >
> > > commit:
> > >   v6.8-rc2
> > >   9c13a708ef ("fsnotify: introduce pre-content permission event")
> > >
> >
> > Hi Oliver,
> >
> > There is an optimization patch in Jan's fsnotify branch:
> >
> > * 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher
> >
> > I rebased my development branch over Jan's fsnotify branch.
> > Can you please re-test the regressing patch.
>
> this doesn't fix the regression is our tests, still

Hi Oliver,

Thank you for the feedback.
It took me some time to come up with a possible solution.
Pushed it to branch
 https://github.com/amir73il/linux fsnotify-perf

* 7ca5d81f2ffa - (github/fsnotify-perf) fsnotify: introduce
pre-content permission event
* f11cc054af02 - fsnotify: optimize the case of no permission event watcher=
s
* 522fcae19571 - fsnotify: use an enum for group priority constants
* 728ae8e9aa68 - fsnotify: move s_fsnotify_connectors into sb connector
* d04bf34990ab - fsnotify: attach sb connector for the lifetime of sb
* dcc32fca414b - fsnotify: count watched object reference only for
connector with marks
* 38afb3e6393d - fsnotify: create helper fsnotify_object_sb() to get
sb from connp
* 2da381128528 - fsnotify: rename fsnotify_{get,put}_sb_connectors()
* e1a893090c4b - (github/fsnotify, fsnotify) Merge remote-tracking
branch 'jack/fsnotify' into fsnotify
* b7dbaace3971 - (jack/fsnotify) fsnotify: Add fsnotify_sb_has_watchers() h=
elper
* 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher

All the work up to:

f11cc054af02 fsnotify: optimize the case of no permission event watchers

should hopefully not make a difference for performance.
I think that f11cc054af02 is going to improve this will-it-scale benchmark
(write loop) and possibly other benchmarks (read loop) as well.

When final commit

7ca5d81f2ffa fsnotify: introduce pre-content permission event

is applied on top of this optimization commit, I expect that it will not
regress the will-it-scale benchmark.

Let me know if this does the job.

Thanks,
Amir.
