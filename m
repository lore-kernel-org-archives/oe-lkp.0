Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A251B267
	for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmV+vk6P"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78102c516a7so43621785a.2
        for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702995403; x=1703600203; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1hgPj7MFbDNRCqt6WQqMxJQUHrpQPcSOTQMRgt0T90=;
        b=lmV+vk6PetCPC+1Lx1enw/OWoiiFl8QLm+Tayopr7AxRlclemh5BEfSYQaJngTCQkp
         9NJY+vEqLP3U13bjjItxvhorXHwLkaV9mrXAwwluqKKXqzOq1wzJ32B+tNmnEQLRjPmF
         EKpgISGxuFQwOgIyh9aRZH8qRcGNb5irxGq/1+i2MayX2wmLo3Bw1UrehsXD+xCEL5LS
         T9C8EItDSWHVeWBEyPqWEy6wjFBTunXTERvmiuDWnHHFOl77ats0KgmKYrnUQ8IF12FF
         YllfJevSrIUb2lB86tmmW8F3wpmKZMX5kYuGDTXuLoDQ2OPSEupYUpZ80ULr/bkFSHRU
         C/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702995403; x=1703600203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1hgPj7MFbDNRCqt6WQqMxJQUHrpQPcSOTQMRgt0T90=;
        b=Ul0z+Yo9SAbLnEzb9Fq9T7h1j7Vf/5pceVrdbXwn2mDHsE5SD37aoNzhK+PKElt5gx
         1Eu2Drxm3HwgVcD/wWLHhbVEkh6CXEt8OjCFzeCHHtLp3XNsR5GQfuBwPot+wIS7M+gz
         W1BatPj0D8FbOsu5aJjiItgC6wROTUXG7znfwu84SMi7tGNxsN+lqY4zQDwKW/es5z36
         zgDuK520TsW93irciFHX0Yyw7LXsKqo06WCpFYl3witdUr3CbluGPcL5YvGkbg7YAuNr
         aO8J3rOBH4fMs6aFMTa04+49u9yEifks0MoPV6e810kxlMGs8ggXBWpRfov59LEK7e/D
         pk7A==
X-Gm-Message-State: AOJu0Yx7IRYMm3dqtFxluXKFpcda5la0bNm07WmK23B/LoEvLj8hHZic
	GwjGf9XL7SXEA57935uT74YscGG41IHoC2G7/xeNZ43BXHk=
X-Google-Smtp-Source: AGHT+IHkE6ICq4qrIxBHk0Tiuo4K5YzIHTH3g6Ogl1uu963bDpVHr1BwyVefAvhvHKndKuUAsFwxwHvkKePAcauWsmI=
X-Received: by 2002:ad4:4a07:0:b0:67a:a721:f33f with SMTP id
 m7-20020ad44a07000000b0067aa721f33fmr20109719qvz.127.1702995402876; Tue, 19
 Dec 2023 06:16:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312181550.3fa030a7-oliver.sang@intel.com> <CAOQ4uxizaaC1RjBYTqPkPJcXj66+-8UVqQR9ArGp40+0FZR8Mg@mail.gmail.com>
 <ZYGipFO2W4VCEjxK@xsang-OptiPlex-9020>
In-Reply-To: <ZYGipFO2W4VCEjxK@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 19 Dec 2023 16:16:31 +0200
Message-ID: <CAOQ4uxjYXL7UjNH_baodAyAcBM-hVngmdcSCRxsjpP5=o_aL7w@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fs] 753d63fa0e: phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s
 -95.7% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 4:03=E2=80=AFPM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> On Mon, Dec 18, 2023 at 01:09:40PM +0200, Amir Goldstein wrote:
> > On Mon, Dec 18, 2023 at 10:17=E2=80=AFAM kernel test robot
> > <oliver.sang@intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a -95.7% regression of phoronix-test-suite.=
iozone.1MB.2GB.WritePerformance.mb_s on:
> > >
> > >
> > > commit: 753d63fa0e79bb7ad14f0351b800f856b5364ec3 ("fs: add srcu varia=
nts for mnt_{want,drop}_write() helpers")
> > > https://github.com/amir73il/linux sb_write_barrier
> >
> > This commit had a bug in overlayfs.
> > Does the test setup use overlayfs?
> > Pushed fix to branch sb_write_barrier.
> > Can you please re-test this branch:
> >
> > * c89fa4b25ff7 - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC f=
lag
> > * 0fed804d8eeb - fanotify: activate sb write barriers for pre-modify
> > event watchers
> > * e464fb4d26e7 - fs: hold s_write_srcu for pre-modify permission
> > events on aio write
> > * 5dc0c9b3e65b - fs: hold s_write_srcu for pre-modify permission events=
 on write
> > * 0651230c4b05 - fs: add srcu variants for mnt_{want,drop}_write() help=
ers
> > * 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() help=
ers
> > * 69e1ebcf925c - fs: implement 'vfs write barriers'
>
> seems you split previous 753d63fa0e to:
> > * 0651230c4b05 - fs: add srcu variants for mnt_{want,drop}_write() help=
ers
> > * 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() help=
ers
>
> our test confirmed the regression is caused by 0651230c4b05
>

Doh! This is an unintentional leftover.
commit 0651230c4b05 is still buggy.
I now removed it from sb_write_barrier and re-pushed:

* cf924e29331a - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag
* 6ecc6ff4de46 - fanotify: activate sb write barriers for pre-modify
event watchers
* 402399aa79fc - fs: hold s_write_srcu for pre-modify permission
events on aio write
* b5a3ee5d5053 - fs: hold s_write_srcu for pre-modify permission events on =
write
* 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
* 69e1ebcf925c - fs: implement 'vfs write barriers'


I would appreciate it if you could re-test the branch again.
Sorry for the trouble.

Thanks,
Amir.
