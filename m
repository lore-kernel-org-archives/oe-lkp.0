Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023D86EB64
	for <oe-lkp@lists.linux.dev>; Wed,  3 Jul 2024 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986307; cv=none; b=a4UJKekKCFqjZoOc1Qx6cqIhYR703SQdmKva3nklbs3/bLQeBV16tx/+R6ZrSYa6H8ootJGpG00aCyzNZ4pBRvL7EZKvDYiEKGHZoszPNdtw0nmr8d6y/U4upLdCqN39q0JyLs6ktfecjl9kr+hAezkT37Ar9ZhGZI1o53Eec74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986307; c=relaxed/simple;
	bh=0laK60eucGLky2ebONnQzKM3TR5jGWaMKqz6byBDav0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqUWrJ5WE3YcM/LMVKbAcG5bI4DhS8rP84ouAsmFsHSYxjYzL+t5sjUuURRPQoeVi5MnR8eTy8fpihgASiBf8TYC34RRWpHq92C1gJEfRa6CxGwTkI3tozWlF0HC8XH+4KiSNpSp6g1ydQebcFz/sC+g7/qfTlStRSNN93XFEzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Axuu+aG9; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Axuu+aG9"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-79c084476bdso444892085a.3
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 22:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719986305; x=1720591105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyMS76D3LWxUVGfRdk1La9i5Uf/bnh27+je93FCdbTA=;
        b=Axuu+aG9XW6Y/GJGmErjCAUZyO1zEipezxYXu8g/9jq6faZgJimYOGlQC4F1qtU72U
         eV/RHKx6kqvZmCu+FGXkLTbeEjSBiJ5vziL2BAK1OLPdkSKGmPs0FHDcRrIpTy9eJu45
         1XbuCHqyX/oib26aJJr8rkZm8NroZS3wBZnkvOB7/YeAPjrQUZisj+ZuUONYJN35uZIo
         /yh3Py4wpmcEi3mfGj+82nAmywx06aN2nMxO6UXgGgGEmtZ35QHLhutAuVtrGrnhpWrq
         0lf04sxvoS3XaCmZN/Ku5260HGMBmumcpxokmRhHTeNDb5I4bbCA4lRa8DbZCnNGLHt0
         fSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986305; x=1720591105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyMS76D3LWxUVGfRdk1La9i5Uf/bnh27+je93FCdbTA=;
        b=phT2ng8opwcyKc86otX2EgFQUu122d4brNx5zXTqSQXwf4lSD1sfmLcjpXnE9GAgW9
         BktvAKLEtVuG0P17JQOw0GYgmS0kIZ6TyZ98vOgIc9LwuV1ZpjC+2bz3skQTLhzN7UjZ
         7jpu5uNyjysPSZ6nyfSDgt9NlvpWIN3NqSAF3/qscfb99JNgyIuT4NCiTL6OuDcjA9r7
         A0K2373o4pA/ZKzCQeqQ3MnV/DWlScBdHNNYJrblP70FB9/l4JJ1RBa0Rc03w4rlpRnC
         1g2jZkbePxYpxtvUX8DOD6Z17lHy3iKi6LTZbpfyKwiLuDFYQItUN6H+dRdNgfXcqDXn
         VfUA==
X-Forwarded-Encrypted: i=1; AJvYcCVVWBnnGHH842L5aSVtC1n9vG/7oijuO+yrEB+f0SsKUhXpEwMndVpNcRF2kbnQPdG3MQPtV9ruAgepn0w46FUksOJOMfwb
X-Gm-Message-State: AOJu0YzFbe0i+raCxOq8LAm1XlWCt4EWFFmU5Sl2gTOSmabs2Tsm0Cfr
	jh1vE99KyGxFAG6Rbvzt87027r6S1gUrDW7bvdbSORi5P+SY/Lhdv2D+SAnhtGbdz1J81Zq6Qt5
	yH57zxyJ8ea0fFuMnV1Y+V9XjW0r9LPUy
X-Google-Smtp-Source: AGHT+IEF2HZnU5KxvDe6s4fXak2v0mVAVuxS18DCdeiSBnGlAToXgIRfbTqa+59Yi9FHsxPy3LQsuCH7jHxKGv4rbI4=
X-Received: by 2002:a37:e21a:0:b0:79b:b571:4c13 with SMTP id
 af79cd13be357-79d7babf81cmr1247969985a.63.1719986304638; Tue, 02 Jul 2024
 22:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291640.2016ebfe-oliver.sang@intel.com> <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020> <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020> <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
In-Reply-To: <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 3 Jul 2024 08:58:13 +0300
Message-ID: <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 10:42=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> sorry for quite late.
>
> On Tue, Jun 04, 2024 at 03:33:39PM +0300, Amir Goldstein wrote:
> > On Mon, Jun 3, 2024 at 11:13=E2=80=AFAM Oliver Sang <oliver.sang@intel.=
com> wrote:
> > >
> > > hi, Amir,
> > >
> > > On Fri, May 31, 2024 at 08:18:09AM +0300, Amir Goldstein wrote:
> > > > On Fri, May 31, 2024 at 6:15=E2=80=AFAM Oliver Sang <oliver.sang@in=
tel.com> wrote:
> > > > >
> > > > > hi, Amir,
> > > > >
> > > > > On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> > > > > > On Wed, May 29, 2024 at 11:26=E2=80=AFAM kernel test robot
> > > > > > <oliver.sang@intel.com> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > kernel test robot noticed a -7.9% regression of unixbench.thr=
oughput on:
> > > > > > >
> > > > > > >
> > > > > > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: =
pass optional file access range in pre-content event")
> > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > >
> > > > > >
> > > > > > Jan,
> > > > > >
> > > > > > I speculate that the regression is due to the fact that we stor=
e and pass the
> > > > > > path information on struct file_range on the stack before the o=
ptimizations
> > > > > > in fsnotify_parent(), so rw_verify_area() pays some price for t=
he stores
> > > > > > and __fsnotify_parent() pays a bigger price for fetches?
> > > > > >
> > > > > > Luckily, we already have the way to check
> > > > > > fsnotify_sb_has_priority_watchers(inode->i_sb,
> > > > > >                                                FSNOTIFY_PRIO_PR=
E_CONTENT))
> > > > > > so now I used it to optimize out the fsnotify_file_range() inli=
ne
> > > > > > code entirely.
> > > > > >
> > > > > > Oliver,
> > > > > >
> > > > > > Can you please re-test with fixed branch (also rebased on v6.10=
-rc1):
> > > > > >
> > > > > > * a82fd282befc - (fan_pre_content) fanotify: report file range =
info
> > > > > > with pre-content events
> > > > > > * f301cd18006c - fanotify: rename a misnamed constant
> > > > > > * 64108c0b47db - fanotify: pass optional file access range in p=
re-content event
> > > > > > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission =
event
> > > > > > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission =
event
> > > > > > * 83af0c89527a - fsnotify: generate pre-content permission even=
t on exec
> > > > > > * aca408421327 - fsnotify: generate pre-content permission even=
t on open
> > > > > > * 93656e196b00 - fsnotify: introduce pre-content permission eve=
nt
> > > > > >
> > > > > > The optimization was done in the first commit (fsnotify: introd=
uce
> > > > > > pre-content permission event),
> > > > > > but impacts the regressing commit (fanotify: pass optional file=
 access
> > > > > > range in pre-content event).
> > > > > > no need to test all middle commits.
> > > > >
> > > > > I directly compare the tip with v6.10-rc1, still a regression but=
 better now
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
> > > > >   a82fd282befc7 ("fanotify: report file range info with pre-conte=
nt events")
> > > > >
> > > > >        v6.10-rc1 a82fd282befc71d99106bf31066
> > > > > ---------------- ---------------------------
> > > > >          %stddev     %change         %stddev
> > > > >              \          |                \
> > > > >  1.216e+08            -3.9%  1.168e+08        unixbench.throughpu=
t
> > > > >
> > > > > full data is as below [1]
> > > > >
> > > > >
> > > > > then I checked new "64108c0b47db - fanotify: pass optional file a=
ccess range in pre-content event"
> > > > >
> > > > > it also has a small regression comparing to its parent, but bette=
r also.
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
> > > > >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission e=
vent")
> > > > >   64108c0b47db9 ("fanotify: pass optional file access range in pr=
e-content event")
> > > > >
> > > > > 94167e071109d573 64108c0b47db91b20d658a89969
> > > > > ---------------- ---------------------------
> > > > >          %stddev     %change         %stddev
> > > > >              \          |                \
> > > > >  1.163e+08            -2.4%  1.135e+08        unixbench.throughpu=
t
> > > > >
> > > > > full data is as below [2]
> > > > >
> > > >
> > > > Ok, this looks sane, the small overhead in the write path makes sen=
se.
> >
> > On second look, while a small regression from 64108c0b47db9 could make
> > sense, because it changes the inline fsnotify hooks, the extra regressi=
on from
> > the tip of the branch a82fd282befc7 makes no sense at all, as it does n=
ot
> > touch any code that affects the executed functions, so I have to wonder=
 how
> > reliable are those results.
> >
> > Could you re-test the commits 94167e071109d..a82fd282befc7?
>
> since the branch is:
>
> * a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range in=
fo with pre-content events  <---
> * f301cd18006c3 fanotify: rename a misnamed constant
> * 64108c0b47db9 fanotify: pass optional file access range in pre-content =
event
> * 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event      =
     <---
> * 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event      =
     <--- parent of 94167e071109d
> * 83af0c89527ab fsnotify: generate pre-content permission event on exec
> * aca4084213276 fsnotify: generate pre-content permission event on open
> * 93656e196b006 fsnotify: introduce pre-content permission event
> * 1613e604df0cd (tag: v6.10-rc1,
>
>
> I made below comparison, which shows little difference among 3 commits:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/3=
00s/lkp-spr-r02/fsbuffer-w/unixbench
>
> commit:
>   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
>   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
>   a82fd282befc7 fanotify: report file range info with pre-content events
>
> 68e04c2451ba03a1 94167e071109d573a5fc1ff3061 a82fd282befc71d99106bf31066
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>  1.174e+08            -0.9%  1.163e+08            -0.5%  1.168e+08       =
 unixbench.throughput
>
>

Hi Oliver,

Perhaps I am not reading the report right, but how do these numbers reconci=
le
with the previous report of regression:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300=
s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
  64108c0b47db9 ("fanotify: pass optional file access range in
pre-content event")

94167e071109d573 64108c0b47db91b20d658a89969
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
 1.163e+08            -2.4%  1.135e+08        unixbench.throughput

Is this a case of unstable results? something else?

> >
> > > > It may have been a "tactic mistake" merging this optimization to v6=
.10-rc1
> > > > a5e57b4d370c ("fsnotify: optimize the case of no permission event w=
atchers")
> > > > before the rest of the pre-content infrastructure, because together=
 they
> > > > would still be a performance win.
> > > >
> > > > Can you please compare this branch to v6.9?
> > >
> > > there is no obvious diff between v6.9 and v6.10-rc1 for this test in =
our tests.
> > >
> >
> > This is a bit surprising to me, because a5e57b4d370c should have been a=
 pretty
> > big performance win for the common case.
>
> in our this unixbench tests, a5e57b4d370c introduce a small regression co=
mparing
> to its parent (477cf917dd028).
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/3=
00s/lkp-spr-r02/fsbuffer-w/unixbench
>
> commit:
>   v6.9
>   477cf917dd028 fsnotify: use an enum for group priority constants
>   a5e57b4d370c6 fsnotify: optimize the case of no permission event watche=
rs
>   v6.10-rc1
>
>             v6.9 477cf917dd02853ba78a73cdeb6 a5e57b4d370c6d320e5bfb0c919 =
                  v6.10-rc1
> ---------------- --------------------------- --------------------------- =
---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>  1.219e+08            +2.8%  1.253e+08            +0.4%  1.224e+08       =
     -0.2%  1.216e+08        unixbench.throughput
>

Assuming this is a stable result,
that's very small regression compared to the improvements before it
and one that I dare to call acceptable for this micro buffered write benchm=
ark
because of the big gain in other workloads.

>
> BTW, for a5e57b4d370c, there is another regression report in
> https://lore.kernel.org/all/202404101624.85684be8-oliver.sang@intel.com/
> which also includes some unixbench improvement results, but different sub=
-tests
> on different platform.
>

Right. I forgot about this one.
Sorry for dropping the ball.
I do not know what is going on there.
I will try to take a look again.

Thanks,
Amir.
