Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A91171E
	for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="EqQQXxlu"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso91254671fa.1
        for <oe-lkp@lists.linux.dev>; Tue, 17 Oct 2023 23:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1697610722; x=1698215522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tjC/IFqkvBBhR48NAuD9T/1qJBmUPzNnAkBCizquaQ=;
        b=EqQQXxlu3YgjG8LrYloPzT5ZIavmsBJ6wjShVSynMU2x455TJcjX1jTiIlNPq3Upc2
         v1ujTPgKRbeI2NAFSypJMHtESOgiG2S2puARPj9PzML+Fz3Yw5LrGAGYNOvJhIAwpGjD
         O11mujZraUOGQTwM7m1KxET9cNUDQ4HwozvX+lQWVSb54hgr7YUM2HBbNGL8qNtuFt2f
         Hh6gVk+hGxSm/rhmlG7p4MU3yujjtKF2dJvrgG531gUjxZj1DSx/akNIuENqR+v9RkN+
         gm3HG+GCem3ux+GP8elNcgxZLHVQJQyRMsRZYAXgxffizFBw7Ivt0R4/LH7L0SXsI/i3
         ZNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697610722; x=1698215522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tjC/IFqkvBBhR48NAuD9T/1qJBmUPzNnAkBCizquaQ=;
        b=VbNiRfvMbMT8gdx5ltdUj3UHHmhExyL9TWFNRVXxtd+N/luf4WaWorZulJ0Hefdm+o
         I+/roHxpdX0gEoZkW+VOrwhVcQOz7Joxl6HvXC8Sm8oOQ4sD1/82Bo1eEvJqbxpPctQK
         944IxPBquvpA+2sNwhzeA/AisrHI+Sp6PzwS+OEp871nG3pixILroeXZHxhtBFsP9gHs
         JlQNI7T009FLECCJvn1Df7hanrDvYC+CFtEB9boIXOQwuXpKzcn9Wd/+wmDE37BHF6yc
         z71KDVREX0cjApfxcwpuVVvzAb4F5/AtcWWvXAywAmAha3FiM+cVklLEMn93henb2WlK
         1VUA==
X-Gm-Message-State: AOJu0Yw/NgiuDnAmhD3TuKet5CHaPRqV6U8B6o32XL4fkyHJCTVUYggX
	GuNhq0X1q5x5vNe4gYLidS4B2uyuNlgjMVi+qfuqow==
X-Google-Smtp-Source: AGHT+IEgPSai5R65B+hsjAZpWjxARBJ9cktgQMzW0R1rlNY1QAnKJwqHR7gz0g3zbBtP0X1OV/UTCcCEGVkLfrIlDGo=
X-Received: by 2002:a2e:9b07:0:b0:2c5:12ae:adb3 with SMTP id
 u7-20020a2e9b07000000b002c512aeadb3mr2829172lji.44.1697610722467; Tue, 17 Oct
 2023 23:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310172247.b9959bd4-oliver.sang@intel.com> <2023101759-front-ember-6354@gregkh>
In-Reply-To: <2023101759-front-ember-6354@gregkh>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 18 Oct 2023 08:31:51 +0200
Message-ID: <CAKPOu+_tQj361LAGNyw+wLnrw=Y709zcA5kjX_95c_4HOv6wxg@mail.gmail.com>
Subject: Re: [linux-next:master] [drivers/char/mem] 1b057bd800:
 stress-ng.splice.ops_per_sec -99.8% regression
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 6:57=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> So everything now goes faster, right?  -99.8% regression means 99.8%
> faster?

That's what I thought, too, and sounds reasonable considering this
test is described as "stress copying of /dev/zero to /dev/null",
but... it's not what that test actually does. Contrary to the
description, it doesn't use /dev/zero at all, neither does it use
/dev/full. So it shouldn't be affected by my patch at all.

strace of that test's setup:

 pipe2([4, 5], 0)                =3D 0
 openat(AT_FDCWD, "/dev/null", O_WRONLY) =3D 6

Then it loops:

 vmsplice(5, [{iov_base=3D"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\0\0"...,
iov_len=3D65536}], 1, 0) =3D 65536
 splice(4, NULL, 6, NULL, 65536, SPLICE_F_MOVE) =3D 65536
 write(5, "\334\360U\300~\361\20jV\367\263,\221\3724\332>7\31H2|\20\254\314=
\212y\275\334I\304\207"...,
4096) =3D 4096
 vmsplice(4, [{iov_base=3D"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\0\0"...,
iov_len=3D4096}], 1, 0) =3D 4096

I don't get it.
