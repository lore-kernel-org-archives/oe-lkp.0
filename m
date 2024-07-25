Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6112D1EB2F
	for <oe-lkp@lists.linux.dev>; Thu, 25 Jul 2024 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721916265; cv=none; b=WFfnp2S7DEASVi8CQsiv5M3yemXG3VdRwm/qrXuC27rrlVkXsrXNUyFNZi3Gshz9+qzrNmiwPpgd1MwSv3F0QYrmV/4Ho4AmMic5wgANhqMGdFss6Pd+Penn1IO+fQxTHxiE9UBPbSRxxs6kn2pX4Wrl3sS8/XzZhvJ8n3w3xjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721916265; c=relaxed/simple;
	bh=S7r8ad3G+dQ6t2VlccQ3UC/E3eKNww+r+qr3CNifft8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsWna8O7eVBkd2utBcmVqm09HZoPU55ASNZ9kC7DEfFIlH6K5ObE2OfFXe1KaacHH+Ib1VKMLoIUBXfU4+1EQ4zaG7ELe6Gz7GBENXw/JetiDeptYWUU01X8BSTidoCVqS9TtU+Bt3nQg05FMCJ49+BY4HfgSOum1/r7qMjDy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMnqcioS; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMnqcioS"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-449f23df593so4800751cf.1
        for <oe-lkp@lists.linux.dev>; Thu, 25 Jul 2024 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721916262; x=1722521062; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P07hUUb4ZriT0aBpYyqzDW06JnhkeGstzlcUkTWDAUE=;
        b=VMnqcioSiVGhuoLsf17AJfLknsaXnDmNMwYD6uSGYpDCMXsXpWLSYpkwATbt2s5xBM
         QYTBjW3xeRO100hZoUF7qiiRdxdRnDAAX5O0RebqXkEFpmSAqDPF9Iu/RkBpzPHpD92x
         hYeVtr3fbR9NV9oSOThs89LtnC2FHNGabMXlWD7G67l+KmiwGz7iWRSWgJHfQTSNxsWZ
         IkehjaImfis1SkgU1CwcwHd1XU9lwCMvXuRIzat4OZEDYAuYcl88ahmq/kDK0KKBCsdS
         oIQnoPU6IsbiVm3qftjBMZs3xfplrt67Nh4YfwDJ1eVxIi6Vpb3ZNJIRy/EjJ+zohnTC
         yClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721916262; x=1722521062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P07hUUb4ZriT0aBpYyqzDW06JnhkeGstzlcUkTWDAUE=;
        b=BX5QRjA2nqCz0Lr7hvPrVuQGpFXXFcQlQ2u2Shnu7Zah951t88mRZg2pFc81HKOlij
         VBuwf1b0cEBOIsLmvNk2hna797qTwkbvV/beZJlaW+pEfGreG3DlMQO7RhimLoSe0aDn
         RJ+euTJlvFJMvNZJRcGiCmUurnkFKk6sozed7BowXyM3S4rR/1GHrdRazbJFSUUGCPYI
         izXv0aCdxl0Iuh0G1FJoA5aJMWDkiS04TKtI4joIqFd6sb2MP1N7s6jCmrvnVPP/ALIR
         9cLcRJ5eQM0NDjL6Ptg3/aFhe/EQ0fLS9aBADIz1DZwfm32Ut0lDs6eVR6A67SD10bdZ
         yf2g==
X-Forwarded-Encrypted: i=1; AJvYcCXN7FOt0SW3UxwqhLwpvDswuh51zBstikkXKzuu5KtobXy+nFLoozJBTiKEr89LcrA23eZ/m5W1AnLyBFxIRA7foksfL5HR
X-Gm-Message-State: AOJu0YyfrbvFIX9qliGyWQrBK2AhVImSQSwG/L8jUWkh/mCETb6Cz1qV
	FGVxCEv1Bi6QnlpRwXAMetqRr8dHMhsTO9KX5qO2rsyKdXKygzLWag5BbeDwrdSUjzpjmLUzgux
	A+EV7rwq8XJ+i2fvlczE09wNNWZw=
X-Google-Smtp-Source: AGHT+IG32wbZBidYlFwL65esV6/+i1EuHd2Gj4uMHp+aCzA6OzupdIBIUVG6sm4dp09pkmoyGvnbw52rlzrV1I/NUGk=
X-Received: by 2002:a05:622a:8e:b0:447:dc5c:fc73 with SMTP id
 d75a77b69052e-44fe927067bmr27453341cf.45.1721916261789; Thu, 25 Jul 2024
 07:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZllA260+kaBSKrPD@xsang-OptiPlex-9020> <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020> <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020> <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020> <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
 <ZodVyZd2esYH/tFu@xsang-OptiPlex-9020> <CAOQ4uxitXLvHgug08zbYRgyy+wNnd_aw8Kr1zcFWwsRLeFf7SA@mail.gmail.com>
 <20240725134107.4wkkx4huw5r2ngol@quack3>
In-Reply-To: <20240725134107.4wkkx4huw5r2ngol@quack3>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 25 Jul 2024 17:04:10 +0300
Message-ID: <CAOQ4uxgAp+NnrgaMsygKYoVtAK4t2pVkFP+NTt_=F4TOJh_Unw@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Jan Kara <jack@suse.cz>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 4:41=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Fri 05-07-24 08:48:28, Amir Goldstein wrote:
> > On Fri, Jul 5, 2024 at 5:09=E2=80=AFAM Oliver Sang <oliver.sang@intel.c=
om> wrote:
> > >
> > > hi, Amir,
> > >
> > > On Wed, Jul 03, 2024 at 07:20:49PM +0300, Amir Goldstein wrote:
> > >
> > > [...]
> > >
> > > > > the data in our tests seem quite stable for a commit, such like f=
or v6.10-rc1:
> > > > >   "unixbench.throughput": [
> > > > >     121545292.8,
> > > > >     121629889.4,
> > > > >     121598992.0,
> > > > >     121492095.5,
> > > > >     121645038.1,
> > > > >     121556286.9
> > > > >   ],
> > > > >
> > > >
> > > > Are all those runs from the same boot?
> > >
> > > no. we reboot machine before each run.
> > >
> > > >
> > > > > for the branch tip a82fd282befc7:
> > > > >   "unixbench.throughput": [
> > > > >     116675606.7,
> > > > >     116840611.2,
> > > > >     116738966.0,
> > > > >     116956953.1,
> > > > >     116704901.9,
> > > > >     116997628.3,
> > > > >     117141733.7,
> > > > >     116660495.4
> > > > >   ],
> > > > >
> > > >
> > > > And these run?
> > >
> > > same.
> > >
> > > >
> > > > Otherwise, we might have a fluctuation that happens at boot time
> > > > or at mount time or something.
> > > >
> > > > >
> > > > > let me combine the results from this branch together:
> > > > >
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_gro=
up/test/testcase:
> > > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-202402=
06.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > > >
> > > > > commit:
> > > > >   v6.10-rc1
> > > > >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission eve=
nt
> > > > >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission eve=
nt
> > > > >   64108c0b47db9 fanotify: pass optional file access range in pre-=
content event
> > > > >   a82fd282befc7 fanotify: report file range info with pre-content
> > > > >
> > > > >        v6.10-rc1 68e04c2451ba03a18ccb1192890 94167e071109d573a5fc=
1ff3061 64108c0b47db91b20d658a89969 a82fd282befc71d99106bf31066
> > > > > ---------------- --------------------------- --------------------=
------- --------------------------- ---------------------------
> > > > >          %stddev     %change         %stddev     %change         =
%stddev     %change         %stddev     %change         %stddev
> > > > >              \          |                \          |            =
    \          |                \          |                \
> > > > >  1.216e+08            -3.5%  1.174e+08            -4.3%  1.163e+0=
8            -6.6%  1.135e+08            -3.9%  1.168e+08        unixbench.=
throughput
> > > > >
> > > > >
> > > > > one thing I want to mention is the "%change" is always comparing =
to the first
> > > > > column (v6.10-rc1 here). so 68e04c2451ba0 has a -3.5% regression =
comparing to
> > > > > v6.10-rc1; 94167e071109d has a -4.3% regression also comparing to=
 v6.10-rc1,
> > > > > and so on.
> > > >
> > > > Thanks for clarifying - I did not read it this way.
> > > >
> > > > >
> > > > > then if just comparing 94167e071109d and 64108c0b47db9, 64108c0b4=
7db9 has about
> > > > > -2.4% regression compareing to 94167e071109d.
> > > > >
> > > > > from above table, along the branch, the performance is kind of fl=
uctuating,
> > > > > dropped most on 64108c0b47db9, but then recovered a little on tip=
.
> > > > >
> > > >
> > > > I can understand why 64108c0b47db91b would regress performance, but=
 I
> > > > cannot think
> > > > of any possible explanation why a82fd282befc should improve perform=
ance,
> > > > so I have to wonder if the regression to -6.6% is not a fluke of so=
me
> > > > specific boot/mount?
> > > >
> > > > I pushed a test branch to
> > > > https://github.com/amir73il/linux/commits/fsnotify_for_lkp
> > > > with an extra patch that un-inlines some helpers to help bisect the
> > > > perf report better.
> > > > Maybe produce the report with this commit and it sheds some light.
> > >
> > > since
> > >
> > > * 388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnot=
ify helpers
> > > * a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file rang=
e info with pre-content events
> > > * f301cd18006c3 fanotify: rename a misnamed constant
> > > * 64108c0b47db9 fanotify: pass optional file access range in pre-cont=
ent event
> > > * 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> > > * 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> > > * 83af0c89527ab fsnotify: generate pre-content permission event on ex=
ec
> > > * aca4084213276 fsnotify: generate pre-content permission event on op=
en
> > > * 93656e196b006 fsnotify: introduce pre-content permission event
> > > * 1613e604df0cd (tag: v6.10-rc1,
> > >
> > > we run tests upon new commit. summary report is as below:
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/t=
est/testcase:
> > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.c=
gz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > >
> > > commit:
> > >   v6.10-rc1
> > >   a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file rang=
e info with pre-content events
> > >   388baed2ddef7 (amir73il/fsnotify_for_lkp) fsnotify: un-inline fsnot=
ify helpers
> > >
> > >        v6.10-rc1 a82fd282befc71d99106bf31066 388baed2ddef701fe2f07ea0=
360
> > > ---------------- --------------------------- ------------------------=
---
> > >          %stddev     %change         %stddev     %change         %std=
dev
> > >              \          |                \          |                =
\
> > >  1.216e+08            -3.9%  1.168e+08            -4.1%  1.166e+08   =
     unixbench.throughput
> > >:
> > >
> > > since Jan mentioned in a later mail that perf profiles are useful, I =
put details
> > > as below
> >
> > Thanks.
> > That clarifies that the cycles are spent in the "optimization code" its=
elf.
>
> BTW, Amir how did you decide that the time is spent in the "optimization
> code"? I've seen in the perf output there are more cache misses, smaller
> IPC, but didn't see a particular place where this would be happening...
>

Oh no I just meant that because there is so much inlined code
in the hooks, I couldn't say for sure if the cycles are spent in the
optimization code that tries to avoid fsnotify_parent() or also
in fsnotify_parent() inline wrapper, so I used the extern fsnotify_path()
jump point to break inlining.

Maybe this was an unneeded test with obvious outcome, but
I began to suspect that the fsnotify_sb_has_priority_watchers()
optimization may have a bug.

Thanks,
Amir.
