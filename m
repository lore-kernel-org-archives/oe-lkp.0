Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793E2181303
	for <oe-lkp@lists.linux.dev>; Wed,  3 Jul 2024 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023665; cv=none; b=dGbAaNWAi94dAJvhGZi+lhbpGftsD4U6dWMzDbqjUB0Z9y0aYhY2bDXZvTEolZUgL3NHE/Ra2vU0qnTwW0iy5pY7hR0Cuj+/1P1VwOTxRypGnfq1eSmB82VwqD4/xGfUYPMQTR7+Il+bvTE/UzePwqKw6hQ5AY/b8+kkqi3rxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023665; c=relaxed/simple;
	bh=zLWxk8xVdVijDoIWgv2t7gIjL2gE9m7Hr3vjBz5H0uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fmj685JqdRFYdt3oUowYMcxx255TkFL76rnU5cmX3YLRcTJpksdlJG2YaUpyhihXAbYq8iyPOVOanU2mEm+tnr/xGmY2JanBJwYZcNRITKCxohqk2ZOlab8ugZOTT2691nxQLpJ+SKs0VmkVlX3goCQF8C6VVl6bzvbSBxWkc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtiKLR45; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtiKLR45"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d55e2e032dso3278900b6e.3
        for <oe-lkp@lists.linux.dev>; Wed, 03 Jul 2024 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023662; x=1720628462; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Cetx3QhyATDV9tYUldLbil+FXURUZf5f16b421mbU=;
        b=PtiKLR450RJV8qOtowCxWXON4Q76cSzSS+wnhEVnZdWyTz5ZpMVRo0agrPQHkz2+lt
         1y8YuLr7KtFJsFyFBEBy0neJBNMNUKHSRUMLALXdHGV6X2+vyF2o7noUVnOZNDzMEtO5
         4jiF2Wqo34++WmwRqwt+u7yUDcrZoJWp/uuFJgOhDs10tg8CBZ9G/ylq/HvubB+HNCu1
         4QI4Fr9ZKiXLJrTPp3Zy1LTkLYFPmsW00e9DaDUTyUDGgIGxXClUiTnJ9NMDQuCX2fk2
         8TgIB0UXXrJy5WoKEdMQyJwHc3WjjcaqP4iIA6qG8zuETFU6G07hp63IDZppu+ygJFhX
         qOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023662; x=1720628462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9Cetx3QhyATDV9tYUldLbil+FXURUZf5f16b421mbU=;
        b=Fqno7iL2M7UWfytm+qrxEYWYrLobdzmAHaXHypcd059OeORahMlq5UB1eUqXYfyWjy
         XtVnVwhbqki/6uC86PfXEMKP57dw3RvLEMbDeyHHle+liBzjozY659ukB1qnt4HwkUAI
         x59eD9vVd3au0wTA1THO/M72jWiOgbEjdzQWIqQODwkb5cB9SgLV8plR1wLi9fP1D/sG
         kn0UcCy+jERi5Q3nEEWfUveK845Drt4z+eHGKtP5VnYUfREU0Co/3Y7bO66QuJhXuTsG
         xn7LGcGE2POjZyMHoUWWrSMTkn6mvoBg3+udtmeHF9QlCTw/dOn8jiJTyma7BCGBiI/u
         UPBA==
X-Forwarded-Encrypted: i=1; AJvYcCXvJCOhgIROzxNSNldPGUbOhxw/pK17sdrUG/dDTI80s7fKxk4FwdMS1rGf69e5ws8dPobEDxqRJSQrhNfhHqTcE75TZVJ5
X-Gm-Message-State: AOJu0Yz76HIlrEgxanCut+UI1uN8FQydreKc8XWJ0B+Rpjn74eHEIdVR
	poESOHkoEhROQyeeb/3xRRxKC1zMIaDwzjRA3cnA9gdZiU/X/bXk8J/Y8SjS/X54dTbS+Jo5kXn
	pm4SF8y1PLkuy2x9B/cQffeREJdI=
X-Google-Smtp-Source: AGHT+IG5wT1AwxqVtOImCmxEtp1bCW0tHI7mjJAET1Q3XA937bLe/sMGlZFpGK67DAW7ZCNFECWwM/A0wKsy2WF+of0=
X-Received: by 2002:a05:6808:23c4:b0:3d8:46d1:26b0 with SMTP id
 5614622812f47-3d846d1296cmr7836036b6e.44.1720023662223; Wed, 03 Jul 2024
 09:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291640.2016ebfe-oliver.sang@intel.com> <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020> <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020> <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020> <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
 <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020>
In-Reply-To: <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 3 Jul 2024 19:20:49 +0300
Message-ID: <CAOQ4uxgk1mGf20=XVkJ6x-YTPaoww6d=v-ViD4Espu7EE+yQcg@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 10:21=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> On Wed, Jul 03, 2024 at 08:58:13AM +0300, Amir Goldstein wrote:
> > On Mon, Jul 1, 2024 at 10:42=E2=80=AFAM Oliver Sang <oliver.sang@intel.=
com> wrote:
> > >
> > > hi, Amir,
> > >
> > > sorry for quite late.
> > >
> > > On Tue, Jun 04, 2024 at 03:33:39PM +0300, Amir Goldstein wrote:
> > > > On Mon, Jun 3, 2024 at 11:13=E2=80=AFAM Oliver Sang <oliver.sang@in=
tel.com> wrote:
> > > > >
> > > > > hi, Amir,
> > > > >
> > > > > On Fri, May 31, 2024 at 08:18:09AM +0300, Amir Goldstein wrote:
> > > > > > On Fri, May 31, 2024 at 6:15=E2=80=AFAM Oliver Sang <oliver.san=
g@intel.com> wrote:
> > > > > > >
> > > > > > > hi, Amir,
> > > > > > >
> > > > > > > On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrot=
e:
> > > > > > > > On Wed, May 29, 2024 at 11:26=E2=80=AFAM kernel test robot
> > > > > > > > <oliver.sang@intel.com> wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hello,
> > > > > > > > >
> > > > > > > > > kernel test robot noticed a -7.9% regression of unixbench=
.throughput on:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanoti=
fy: pass optional file access range in pre-content event")
> > > > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > > > >
> > > > > > > >
> > > > > > > > Jan,
> > > > > > > >
> > > > > > > > I speculate that the regression is due to the fact that we =
store and pass the
> > > > > > > > path information on struct file_range on the stack before t=
he optimizations
> > > > > > > > in fsnotify_parent(), so rw_verify_area() pays some price f=
or the stores
> > > > > > > > and __fsnotify_parent() pays a bigger price for fetches?
> > > > > > > >
> > > > > > > > Luckily, we already have the way to check
> > > > > > > > fsnotify_sb_has_priority_watchers(inode->i_sb,
> > > > > > > >                                                FSNOTIFY_PRI=
O_PRE_CONTENT))
> > > > > > > > so now I used it to optimize out the fsnotify_file_range() =
inline
> > > > > > > > code entirely.
> > > > > > > >
> > > > > > > > Oliver,
> > > > > > > >
> > > > > > > > Can you please re-test with fixed branch (also rebased on v=
6.10-rc1):
> > > > > > > >
> > > > > > > > * a82fd282befc - (fan_pre_content) fanotify: report file ra=
nge info
> > > > > > > > with pre-content events
> > > > > > > > * f301cd18006c - fanotify: rename a misnamed constant
> > > > > > > > * 64108c0b47db - fanotify: pass optional file access range =
in pre-content event
> > > > > > > > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permiss=
ion event
> > > > > > > > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permiss=
ion event
> > > > > > > > * 83af0c89527a - fsnotify: generate pre-content permission =
event on exec
> > > > > > > > * aca408421327 - fsnotify: generate pre-content permission =
event on open
> > > > > > > > * 93656e196b00 - fsnotify: introduce pre-content permission=
 event
> > > > > > > >
> > > > > > > > The optimization was done in the first commit (fsnotify: in=
troduce
> > > > > > > > pre-content permission event),
> > > > > > > > but impacts the regressing commit (fanotify: pass optional =
file access
> > > > > > > > range in pre-content event).
> > > > > > > > no need to test all middle commits.
> > > > > > >
> > > > > > > I directly compare the tip with v6.10-rc1, still a regression=
 but better now
> > > > > > >
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox=
_group/test/testcase:
> > > > > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20=
240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > > > > >
> > > > > > > commit:
> > > > > > >   v6.10-rc1
> > > > > > >   a82fd282befc7 ("fanotify: report file range info with pre-c=
ontent events")
> > > > > > >
> > > > > > >        v6.10-rc1 a82fd282befc71d99106bf31066
> > > > > > > ---------------- ---------------------------
> > > > > > >          %stddev     %change         %stddev
> > > > > > >              \          |                \
> > > > > > >  1.216e+08            -3.9%  1.168e+08        unixbench.throu=
ghput
> > > > > > >
> > > > > > > full data is as below [1]
> > > > > > >
> > > > > > >
> > > > > > > then I checked new "64108c0b47db - fanotify: pass optional fi=
le access range in pre-content event"
> > > > > > >
> > > > > > > it also has a small regression comparing to its parent, but b=
etter also.
> > > > > > >
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox=
_group/test/testcase:
> > > > > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20=
240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > > > > >
> > > > > > > commit:
> > > > > > >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permissi=
on event")
> > > > > > >   64108c0b47db9 ("fanotify: pass optional file access range i=
n pre-content event")
> > > > > > >
> > > > > > > 94167e071109d573 64108c0b47db91b20d658a89969
> > > > > > > ---------------- ---------------------------
> > > > > > >          %stddev     %change         %stddev
> > > > > > >              \          |                \
> > > > > > >  1.163e+08            -2.4%  1.135e+08        unixbench.throu=
ghput
> > > > > > >
> > > > > > > full data is as below [2]
> > > > > > >
> > > > > >
> > > > > > Ok, this looks sane, the small overhead in the write path makes=
 sense.
> > > >
> > > > On second look, while a small regression from 64108c0b47db9 could m=
ake
> > > > sense, because it changes the inline fsnotify hooks, the extra regr=
ession from
> > > > the tip of the branch a82fd282befc7 makes no sense at all, as it do=
es not
> > > > touch any code that affects the executed functions, so I have to wo=
nder how
> > > > reliable are those results.
> > > >
> > > > Could you re-test the commits 94167e071109d..a82fd282befc7?
> > >
> > > since the branch is:
> > >
> > > * a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file rang=
e info with pre-content events  <---
> > > * f301cd18006c3 fanotify: rename a misnamed constant
> > > * 64108c0b47db9 fanotify: pass optional file access range in pre-cont=
ent event
> > > * 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event  =
         <---
> > > * 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event  =
         <--- parent of 94167e071109d
> > > * 83af0c89527ab fsnotify: generate pre-content permission event on ex=
ec
> > > * aca4084213276 fsnotify: generate pre-content permission event on op=
en
> > > * 93656e196b006 fsnotify: introduce pre-content permission event
> > > * 1613e604df0cd (tag: v6.10-rc1,
> > >
> > >
> > > I made below comparison, which shows little difference among 3 commit=
s:
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
> > >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> > >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> > >   a82fd282befc7 fanotify: report file range info with pre-content eve=
nts
> > >
> > > 68e04c2451ba03a1 94167e071109d573a5fc1ff3061 a82fd282befc71d99106bf31=
066
> > > ---------------- --------------------------- ------------------------=
---
> > >          %stddev     %change         %stddev     %change         %std=
dev
> > >              \          |                \          |                =
\
> > >  1.174e+08            -0.9%  1.163e+08            -0.5%  1.168e+08   =
     unixbench.throughput
> > >
> > >
> >
> > Hi Oliver,
> >
> > Perhaps I am not reading the report right, but how do these numbers rec=
oncile
> > with the previous report of regression:
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/tes=
t/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz=
/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
> >   64108c0b47db9 ("fanotify: pass optional file access range in
> > pre-content event")
> >
> > 94167e071109d573 64108c0b47db91b20d658a89969
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> >
> > Is this a case of unstable results? something else?
>
> you could see the data for 94167e071109d are 1.163e+08 in both table.
>
> the data in our tests seem quite stable for a commit, such like for v6.10=
-rc1:
>   "unixbench.throughput": [
>     121545292.8,
>     121629889.4,
>     121598992.0,
>     121492095.5,
>     121645038.1,
>     121556286.9
>   ],
>

Are all those runs from the same boot?

> for the branch tip a82fd282befc7:
>   "unixbench.throughput": [
>     116675606.7,
>     116840611.2,
>     116738966.0,
>     116956953.1,
>     116704901.9,
>     116997628.3,
>     117141733.7,
>     116660495.4
>   ],
>

And these run?

Otherwise, we might have a fluctuation that happens at boot time
or at mount time or something.

>
> let me combine the results from this branch together:
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
>   v6.10-rc1
>   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
>   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
>   64108c0b47db9 fanotify: pass optional file access range in pre-content =
event
>   a82fd282befc7 fanotify: report file range info with pre-content
>
>        v6.10-rc1 68e04c2451ba03a18ccb1192890 94167e071109d573a5fc1ff3061 =
64108c0b47db91b20d658a89969 a82fd282befc71d99106bf31066
> ---------------- --------------------------- --------------------------- =
--------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev     %change         %stddev
>              \          |                \          |                \   =
       |                \          |                \
>  1.216e+08            -3.5%  1.174e+08            -4.3%  1.163e+08       =
     -6.6%  1.135e+08            -3.9%  1.168e+08        unixbench.throughp=
ut
>
>
> one thing I want to mention is the "%change" is always comparing to the f=
irst
> column (v6.10-rc1 here). so 68e04c2451ba0 has a -3.5% regression comparin=
g to
> v6.10-rc1; 94167e071109d has a -4.3% regression also comparing to v6.10-r=
c1,
> and so on.

Thanks for clarifying - I did not read it this way.

>
> then if just comparing 94167e071109d and 64108c0b47db9, 64108c0b47db9 has=
 about
> -2.4% regression compareing to 94167e071109d.
>
> from above table, along the branch, the performance is kind of fluctuatin=
g,
> dropped most on 64108c0b47db9, but then recovered a little on tip.
>

I can understand why 64108c0b47db91b would regress performance, but I
cannot think
of any possible explanation why a82fd282befc should improve performance,
so I have to wonder if the regression to -6.6% is not a fluke of some
specific boot/mount?

I pushed a test branch to
https://github.com/amir73il/linux/commits/fsnotify_for_lkp
with an extra patch that un-inlines some helpers to help bisect the
perf report better.
Maybe produce the report with this commit and it sheds some light.

Jan, any other ideas?

> our bot will not bisect the improvment between 64108c0b47db9 and the tip,=
 since
> the whole branch show a drop.
>
> >
> > > >
> > > > > > It may have been a "tactic mistake" merging this optimization t=
o v6.10-rc1
> > > > > > a5e57b4d370c ("fsnotify: optimize the case of no permission eve=
nt watchers")
> > > > > > before the rest of the pre-content infrastructure, because toge=
ther they
> > > > > > would still be a performance win.
> > > > > >
> > > > > > Can you please compare this branch to v6.9?
> > > > >
> > > > > there is no obvious diff between v6.9 and v6.10-rc1 for this test=
 in our tests.
> > > > >
> > > >
> > > > This is a bit surprising to me, because a5e57b4d370c should have be=
en a pretty
> > > > big performance win for the common case.
> > >
> > > in our this unixbench tests, a5e57b4d370c introduce a small regressio=
n comparing
> > > to its parent (477cf917dd028).
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
> > >   v6.9
> > >   477cf917dd028 fsnotify: use an enum for group priority constants
> > >   a5e57b4d370c6 fsnotify: optimize the case of no permission event wa=
tchers
> > >   v6.10-rc1
> > >
> > >             v6.9 477cf917dd02853ba78a73cdeb6 a5e57b4d370c6d320e5bfb0c=
919                   v6.10-rc1
> > > ---------------- --------------------------- ------------------------=
--- ---------------------------
> > >          %stddev     %change         %stddev     %change         %std=
dev     %change         %stddev
> > >              \          |                \          |                =
\          |                \
> > >  1.219e+08            +2.8%  1.253e+08            +0.4%  1.224e+08   =
         -0.2%  1.216e+08        unixbench.throughput
> > >
> >
> > Assuming this is a stable result,
> > that's very small regression compared to the improvements before it
> > and one that I dare to call acceptable for this micro buffered write be=
nchmark
> > because of the big gain in other workloads.
>
> again, all data here is comparing to v6.9, so there is a 2.8% improvement=
 on
> 477cf917dd028 comparing to v6.9, but it drops back on a5e57b4d370c6, whos=
e
> data is almost same with v6.9 (so +0.4% comparing to v6.9).
>
> anyway, we normally ignore <1% performance changes, so we won't say
> a5e57b4d370c6 or v6.10-rc1 has obvious performance changes comparing to v=
6.9.
>

This fluctuation is also hard to explain.

Jan, any thoughts? things to try?

Thanks,
Amir.
