Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53310145B2F
	for <oe-lkp@lists.linux.dev>; Tue,  4 Jun 2024 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717504436; cv=none; b=NWp3WlL5gS/lKG0OJcBUmHp+RCnvxiVflhBkyhLxDv7znheTAiv0UVTYQrWdO2QMAhq4db1VcBzJxS1Ejzlkb8Oai70mQN9Rbvuk9DKSDwozxLUZl1KpTLplhc1z2GY5YxopoapViSpSWpU3glo2BPEHiQtx7VOYyyXN6+ZeWvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717504436; c=relaxed/simple;
	bh=xqnBwRGzTKgCg/TmJnWXo/heCPZ+iwsVPbRShoufNjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suMMlL3nkUgkNUDwm4QOevHIvpqoEDlSdp5qa8eJwZ8eHxy6X20Iq0qP7BjGaz6igYEttdbK6dpuiVhCkbq1//Vy3Z+uZG97uZf/Udo66zHS1hHDktf5vr6riz3UfSf57YFWzcp9XtDBoyIxsvtfqejyV3nSGAs2wPIrVQydn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViFYZL5/; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViFYZL5/"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-794ab4480beso395308285a.1
        for <oe-lkp@lists.linux.dev>; Tue, 04 Jun 2024 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717504433; x=1718109233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yfjn3msxw1rw+8Ne+8eKdnft2hOA5kAhDChZxq/ytLc=;
        b=ViFYZL5/W0lx8BKv+nlailmDGS4xmVRJlBmqbYGYoDErwMECcMLdp0ZBFL31+BVacR
         nWZp7ubR8sU7jaObmkDhATaQ/EoiKPhbHyu+Dx8useKC+XqpA1TN+U0WUCKQaXqM6Usd
         HlK9IW+GC3kbgaVdxXNZnsayyFy4AiMjrSj6+ylVAEJRfFML5QoxJpa8tvKDnwf+7Oty
         u+qB7vO0z/xOtf/IV+ZDiIdPW4ES2u8gvktFg8ZXDUW2BoOZRMUULerF/q6sIgfCXATa
         PnaLDQL8em/vGQlj/kmQ1B9uXVWzCrbilywFCYqbesdKaYNuxPlR6dXDnQafY+2LRKjZ
         6WDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717504433; x=1718109233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yfjn3msxw1rw+8Ne+8eKdnft2hOA5kAhDChZxq/ytLc=;
        b=b5AZo9LF3hwce4PTLIPbo/BMAKAnc6hsX7u5AexLLg/nYED0kPU2DhHWZ7I0V1aJaX
         HGYEMQsip6m5BHq/gFFyQJOK5X2u7hUlsDtAr8ny1GxcZP/VAlLL71o5JMBBaQOchvdk
         oVSGneNQX352cuJB4Y7ztAA3VD7Q3VLkU6vulWgjhTMn3z8QGcIeXfPf3xvaauYDDTxu
         U9qI+0mXdQPkEQmeI6d6smPrOvPA2CpR2TpgMFpDCrnQQVVIDKukoKn9gjV2JqMqYMw+
         bBpcucPvKTo3XHMrb0d//N5LXI8fMbfCybywhXSoUpWd60gWWcr2IagDNb3N/4KB+qVX
         wmFA==
X-Forwarded-Encrypted: i=1; AJvYcCVN/SN8kolUhoQIzwcVmkLxzQdUONBkSN4zLc3IYRA93Y8xk7FRPHIGSxFCT3hzwlWfimE/Vow7n01W175IoqKBWHeY+8ve
X-Gm-Message-State: AOJu0YyNUWDisV1OI/fFkza1FmZRmZxNexVeKANT9eQ0sIm880lcoinI
	j+AyLVWbQC9mGBrEPOfwzEuic2Go4ZtREx0ZJKppb85eTxDrv2RaB8Mbya/ddlZMt0Ro7I5afza
	lbP8ct2Rg/vAdGzGB2YukucMmRzA=
X-Google-Smtp-Source: AGHT+IFcmxQxXrJR3t2nYvvfmepS+XAbNAzkIIfBdfZklGlMqGRmd6k9t51wvDB+J+8t8MMGLMaZaOsrYFkOvZ+kaVs=
X-Received: by 2002:a05:620a:200f:b0:794:f293:de23 with SMTP id
 af79cd13be357-794f5ed08fdmr1174276585a.62.1717504433003; Tue, 04 Jun 2024
 05:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405291640.2016ebfe-oliver.sang@intel.com> <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020> <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
In-Reply-To: <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 4 Jun 2024 15:33:39 +0300
Message-ID: <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 11:13=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> On Fri, May 31, 2024 at 08:18:09AM +0300, Amir Goldstein wrote:
> > On Fri, May 31, 2024 at 6:15=E2=80=AFAM Oliver Sang <oliver.sang@intel.=
com> wrote:
> > >
> > > hi, Amir,
> > >
> > > On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> > > > On Wed, May 29, 2024 at 11:26=E2=80=AFAM kernel test robot
> > > > <oliver.sang@intel.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > kernel test robot noticed a -7.9% regression of unixbench.through=
put on:
> > > > >
> > > > >
> > > > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass=
 optional file access range in pre-content event")
> > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > >
> > > >
> > > > Jan,
> > > >
> > > > I speculate that the regression is due to the fact that we store an=
d pass the
> > > > path information on struct file_range on the stack before the optim=
izations
> > > > in fsnotify_parent(), so rw_verify_area() pays some price for the s=
tores
> > > > and __fsnotify_parent() pays a bigger price for fetches?
> > > >
> > > > Luckily, we already have the way to check
> > > > fsnotify_sb_has_priority_watchers(inode->i_sb,
> > > >                                                FSNOTIFY_PRIO_PRE_CO=
NTENT))
> > > > so now I used it to optimize out the fsnotify_file_range() inline
> > > > code entirely.
> > > >
> > > > Oliver,
> > > >
> > > > Can you please re-test with fixed branch (also rebased on v6.10-rc1=
):
> > > >
> > > > * a82fd282befc - (fan_pre_content) fanotify: report file range info
> > > > with pre-content events
> > > > * f301cd18006c - fanotify: rename a misnamed constant
> > > > * 64108c0b47db - fanotify: pass optional file access range in pre-c=
ontent event
> > > > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission even=
t
> > > > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission even=
t
> > > > * 83af0c89527a - fsnotify: generate pre-content permission event on=
 exec
> > > > * aca408421327 - fsnotify: generate pre-content permission event on=
 open
> > > > * 93656e196b00 - fsnotify: introduce pre-content permission event
> > > >
> > > > The optimization was done in the first commit (fsnotify: introduce
> > > > pre-content permission event),
> > > > but impacts the regressing commit (fanotify: pass optional file acc=
ess
> > > > range in pre-content event).
> > > > no need to test all middle commits.
> > >
> > > I directly compare the tip with v6.10-rc1, still a regression but bet=
ter now
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
> > >   a82fd282befc7 ("fanotify: report file range info with pre-content e=
vents")
> > >
> > >        v6.10-rc1 a82fd282befc71d99106bf31066
> > > ---------------- ---------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >  1.216e+08            -3.9%  1.168e+08        unixbench.throughput
> > >
> > > full data is as below [1]
> > >
> > >
> > > then I checked new "64108c0b47db - fanotify: pass optional file acces=
s range in pre-content event"
> > >
> > > it also has a small regression comparing to its parent, but better al=
so.
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
> > >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event=
")
> > >   64108c0b47db9 ("fanotify: pass optional file access range in pre-co=
ntent event")
> > >
> > > 94167e071109d573 64108c0b47db91b20d658a89969
> > > ---------------- ---------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> > >
> > > full data is as below [2]
> > >
> >
> > Ok, this looks sane, the small overhead in the write path makes sense.

On second look, while a small regression from 64108c0b47db9 could make
sense, because it changes the inline fsnotify hooks, the extra regression f=
rom
the tip of the branch a82fd282befc7 makes no sense at all, as it does not
touch any code that affects the executed functions, so I have to wonder how
reliable are those results.

Could you re-test the commits 94167e071109d..a82fd282befc7?

> > It may have been a "tactic mistake" merging this optimization to v6.10-=
rc1
> > a5e57b4d370c ("fsnotify: optimize the case of no permission event watch=
ers")
> > before the rest of the pre-content infrastructure, because together the=
y
> > would still be a performance win.
> >
> > Can you please compare this branch to v6.9?
>
> there is no obvious diff between v6.9 and v6.10-rc1 for this test in our =
tests.
>

This is a bit surprising to me, because a5e57b4d370c should have been a pre=
tty
big performance win for the common case.

Especially, considering that here [1] you reported in pre-merge testing tha=
t an
identical commit has improved the fstime-r/unixbench workload
(although with gcc-12):
[1] https://lore.kernel.org/oe-lkp/Zfj3wxDHolB1qCGO@xsang-OptiPlex-9020/
and here [2] that a similar commit had improved writeseek1/will-it-scale
[2] https://lore.kernel.org/all/Zc7KmlQ1cYVrPMQ+@xsang-OptiPlex-9020/

Judging by simple_write_begin() in this regression perf report, and
shmem_file_write_iter in the reports above, may I assume that this report
was with a kernel with non-default config !CONFIG_SHMEM?
Is that correct? Is this an intended config change?

Thanks,
Amir.
