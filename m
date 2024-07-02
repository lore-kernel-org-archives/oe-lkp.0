Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141643152
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719942415; cv=none; b=AvbBDLAapbE19sTx0l+JmgE1YmB89RBTKzz3aSNPasZfJKkOrajNQ8CzBXRCEAHMEe+AVD2fO8n+//dv4UkSEHjWD4Gzj1tp9oSVsUU5wWF6vGn5X4ZPNLR5SmKOLKMWSj8n8EK9JlMS33HDonvkjM6AVwqwZligEVTCtrRIhpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719942415; c=relaxed/simple;
	bh=I9LudFqvhzywM8+PbU1gzhtr4RCksBJHHLnpxcJPyI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHKNlrLURseo0shPMjs8AIcfNXT/yq2A66kdAOWhWgxWWaG0kxJJPgt+4gEZN8j2UFYXUWpQgFEIXgL+4SOFk88Qpby6wDWmuLQVIsqLS+BL2VQOngmzHpFH6nQTHiKR+m5zbX7lNZOsj6aex/Dd9u+8oUfOs1EEDYiVFA1x0qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbU3K5r7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbU3K5r7"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso40932e87.2
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719942412; x=1720547212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9LudFqvhzywM8+PbU1gzhtr4RCksBJHHLnpxcJPyI4=;
        b=YbU3K5r7mjJpFv+f798IW94Y499BqsJZ8Xdc3q4DN8On3jVURU8CpAoHXw/LqG5UdM
         9XdLsO5tYEdOWdSHH0TMhBy+sGwizv0NoMU7gZVRjPqV9CBP60NDYVK564D6iQAqCkl9
         34KRzZmxtx9KzK/0WSB/lzHnRhMACFLh5xvjovmi0GpIO7yBj1ZpbnsiLLDULBRc1KU4
         Q4oUXUxNGPPQ/cr6h10xxKhc3wKbrTcSshVFICkNHTPaqeqCSa+th3Jg6F+mh80u4OMV
         D+9CAOuMtmPG5XS21g6sr8A+YgSKX3fdqFr10Ywn7hFq3h2/fvkYVcqtLbDMOpHg9rUl
         C9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719942412; x=1720547212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9LudFqvhzywM8+PbU1gzhtr4RCksBJHHLnpxcJPyI4=;
        b=tG3IKnrWGU4fQqYFwzi+iG88TQPvDiVsknkPBi3F9UuxbmzlA7hw5GGHKVoOe+ygM6
         7KF/z60SqKd4KlQjnUhoptAVDWxlRMkMXR8THmII1mpFpcmBGnIZYP0YaN6xvXPow0rJ
         XhBeUkIn8mLVT/jULuSM+arE9K1KchvpvHrxXxRFkQ3Jp3GRyPxyWw9GUIPkoZ8bpJ3s
         ViYl3ooK5YWwMhovT+Iyy4S39HHizH90bkEGUJViZ51nP9XRUtBEYDhqpVoMeDepAnac
         /ceByCQjzcAzz//KtfxYGjiKTxql64xn+cTJ0IawZmFsW9tCNxacybA1QuNcIr03Cn6x
         xnPA==
X-Forwarded-Encrypted: i=1; AJvYcCVfRDnRVoDU3lqQX0xdfmr4DAmm/AIMYFUne2xmbWnmfIBz33MDrYVIkiMyCkIb+dcST0OgnSGsrciYPofeB64zKkwjh7Qo
X-Gm-Message-State: AOJu0Yw0nA1X21ik3GHLDufU0SL1NoJOGPj5rfQEtOn/LGAz35nPvQdO
	2CgQYcoS7MqUuFogQUU9yLdJqWvySls8vd26kd3LL/57nGcpM0yQIXpnbe8S0tuaUGuXGEY8D5d
	k9tshEB7A6twa9GDimXDPzmze7v8=
X-Google-Smtp-Source: AGHT+IEBbZsL301fTpokOmoMZTiPUizu1JrFyQ0P6YdSWvW3tyH2OnxtLZJKdilNRvkgjMEV5fLXKoBYn3fajVYprKY=
X-Received: by 2002:a05:6512:234a:b0:52e:9471:e54d with SMTP id
 2adb3069b0e04-52e9471e73dmr138254e87.65.1719942411502; Tue, 02 Jul 2024
 10:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
 <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
 <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com> <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
In-Reply-To: <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 2 Jul 2024 19:46:39 +0200
Message-ID: <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 7:28=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 2 Jul 2024 at 10:03, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > I was thinking a different approach.
> >
> > A lookup variant which resolves everything and returns the dentry + an
> > information whether this is rcu mode.
>
> That would work equally.
>
> But the end result ends up being very similar: you need to hook into
> that final complete_walk() -> try_to_unlazy() -> legitimize_path() and
> check a flag whether you actually then do "get_lockref_or_dead()" or
> not.
>

Ye, the magic routine to validate if you can pretend the ref was taken
would wrap it.

> It really *shouldn't* be too bad, but this is just so subtle code that
> it just takes a lot of care. Even if the patch itself ends up not
> necessarily being very large.
>
> As mentioned, I've looked at it, but it always ended up being _just_
> scary enough that I never really started doing it.
>

I implemented something like this as a demo in FreeBSD few years back,
it did not blow up at least. The work did not get committed though
because I could not be arsed to productize it.

tbf if anything the only shady things here that I see is that stat et
al do their work without any locks held nor seqc verification in
current kernel.

In FreeBSD this was operating directly in vnodes (here one can pretend
it's inodes). In that system I added sequence counters to the vnode
itself and any state change like write, setattr, unlink or whatever
would bump it. Then something like stat could safely read whatever it
wants in a lockless manner with the final check for maching seqc
indicating nothing changed.

Not having a "someone is messing with the inode" indicator (only with
a dentry) in Linux is definitely worrisome when pushing RCU further,
if that's what you meant.

Again, I'm going to poke around if only for kicks when I find the time
and we will see what happens.
--=20
Mateusz Guzik <mjguzik gmail.com>
