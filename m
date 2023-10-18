Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9B134BF
	for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="iX+7Y/v/"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c5056059e0so77288541fa.3
        for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1697624481; x=1698229281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NQmXh5DgD5FCRDoX7njGdeBFSEHaOg28db7b5cONLI=;
        b=iX+7Y/v/UFxbAl5bb4wGtEPkOZyKcdcMVlsxa/gIOzNwITNroaQRkpUoG1wyoBoXBi
         /PFmv17vfZtxeAHkSCuBjjeuTs0TXFmq81qbHbiAi6yuULQRcQv2nh2DJdeLkVePW0qx
         TXDJwcASbpeAVknYaaDjJ4LGyPlE4LEDWAkBaZce/YBR9/rqkckvFvuOXEO085k+1egQ
         LVUDUVo2EYbaXDntvqbHMxYllkaKrPFezPZ9yYk5K5OSJc+nIk2vQn2zVvKq4QPOv4Sw
         h5frolas/aDMQ+2XiY6njASV2JFichcReV4IN6ZG643hrC19bOIJ94o66tYWT3F74jew
         JBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624481; x=1698229281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NQmXh5DgD5FCRDoX7njGdeBFSEHaOg28db7b5cONLI=;
        b=X0iAMqUyFZ1rhB/kFeOhL1nYtUDVtPfFRjf/kQlgZltGIcfKwxt+HqzG3HQ4V9zynQ
         dZI32tM4lJZzS2FlQHXUmcFfstopwWWmpQwsq002/CiMAAP2tWP/3aMwueQT7ZIs6i3T
         mJKThFoXIobMSHH5wOtJ/j3poz3L8qdl2TbV1/cfCQf4noNFvUwImye2H1Xgy1qMP+Iv
         DhcrSmf43UdDTv/znbCSLoQvQ1LcocKyajP+QuQsaQSF0l0LBMJ1MkJDIj89YqpSpV+a
         RFE4fSn8WRv2stMk/7jbjaiSwCIHJt0yjtEA4JcWuQ8ruJe3yfHYpIK+u148b0j3ji3c
         EBOg==
X-Gm-Message-State: AOJu0YyFAyiEJj8OI/vSKS4iAxLQ3S2bRwP7/rBlO0fzu/GF5+QfCKAJ
	ffZZU6upLILMAhE4e6JlZHiDxXMRTGxovqok7PtwMg==
X-Google-Smtp-Source: AGHT+IHCHzoxf5Bypv8cy8suMlcvN6Q2pNRWjFR44l+m3kMIH8AMxPDEBvhAy0UwdK8hQfqDjSOAB67tIS7ywAzfGIg=
X-Received: by 2002:a2e:8502:0:b0:2be:58f3:ccee with SMTP id
 j2-20020a2e8502000000b002be58f3cceemr3615874lji.41.1697624481214; Wed, 18 Oct
 2023 03:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310172247.b9959bd4-oliver.sang@intel.com>
In-Reply-To: <202310172247.b9959bd4-oliver.sang@intel.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 18 Oct 2023 12:21:10 +0200
Message-ID: <CAKPOu+_T8xk4yd2P4KT4j3eMoFqwYmkxqDHaFtv4Hii5-XyPuA@mail.gmail.com>
Subject: Re: [linux-next:master] [drivers/char/mem] 1b057bd800:
 stress-ng.splice.ops_per_sec -99.8% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 5:07=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>     743.57          +334.3%       3229 =C4=85  3%  stress-ng.splice.MB_pe=
r_sec_splice_rate
>   7.46e+08           -99.8%    1373628 =C4=85  3%  stress-ng.splice.ops
>   12433266           -99.8%      22893 =C4=85  3%  stress-ng.splice.ops_p=
er_sec

I think this might be caused by a bug in stress-ng, leading to
blocking pipe writes.

This is how it looks before my patch:

 openat(AT_FDCWD, "/dev/zero", O_RDONLY) =3D 4
 pipe2([5, 6], 0)                  =3D 0
 fcntl(6, F_SETPIPE_SZ, 65536)     =3D 65536
 [...]
 write(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
"...,
65536) =3D 65536
 splice(5, NULL, 8, NULL, 65536, SPLICE_F_MOVE) =3D 65536
 [...]
 splice(5, [1], 6, [1], 4096, SPLICE_F_MORE) =3D -1 ESPIPE (Illegal seek)
 splice(4, NULL, 6, [1], 65536, SPLICE_F_MOVE) =3D -1 ESPIPE (Illegal seek)
 splice(5, [1], 13, NULL, 65536, SPLICE_F_MORE) =3D -1 ESPIPE (Illegal seek=
)
 splice(4, NULL, 6, NULL, 0, 0)    =3D 0
 splice(4, NULL, 6, NULL, 1,
SPLICE_F_MOVE|SPLICE_F_NONBLOCK|SPLICE_F_MORE|SPLICE_F_GIFT|0xfffffff0)
=3D -1 EINVAL (Invalid argument)
 splice(4, NULL, 6, NULL, 1, 0)    =3D -1 EINVAL (Invalid argument)
 splice(6, [0], 6, [0], 4096, SPLICE_F_MOVE) =3D -1 ESPIPE (Illegal seek)
 [...]
 write(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
"...,
65536) =3D 65536

Each iteration writes 65536 bytes into the pipe and then reads those
65536 bytes back from the pipe.

After my patch (but "use_splice" disabled manually so the syscalls are
the same):

 openat(AT_FDCWD, "/dev/zero", O_RDONLY) =3D 4
 pipe2([5, 6], 0)                  =3D 0
 fcntl(6, F_SETPIPE_SZ, 65536)     =3D 65536
 [...]
 write(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
"...,
65536) =3D 65536
 splice(5, NULL, 8, NULL, 65536, SPLICE_F_MOVE) =3D 65536
 [...]
 splice(5, [1], 6, [1], 4096, 0)   =3D -1 ESPIPE (Illegal seek)
 splice(4, NULL, 6, [1], 65536, SPLICE_F_MORE) =3D -1 ESPIPE (Illegal seek)
 splice(5, [1], 13, NULL, 65536, 0) =3D -1 ESPIPE (Illegal seek)
 splice(4, NULL, 6, NULL, 0, SPLICE_F_MOVE|SPLICE_F_MORE) =3D 0
 splice(4, NULL, 6, NULL, 1,
SPLICE_F_MOVE|SPLICE_F_NONBLOCK|SPLICE_F_MORE|SPLICE_F_GIFT|0xfffffff0)
=3D -1 EINVAL (Invalid argument)
 splice(4, NULL, 6, NULL, 1, 0)    =3D 1
 splice(6, [0], 6, [0], 4096, 0)   =3D -1 ESPIPE (Illegal seek)
 [...]
 write(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
"...,
65536) =3D 61440
 --- SIGALRM {si_signo=3DSIGALRM, si_code=3DSI_KERNEL} ---

Just as before, each iteration reads 65536 bytes from the pipe, but it
will write an additional byte into the pipe, because the second
splice(/dev/zero) did not fail with EINVAL!
The next write() blocks because the pipe buffer is already full,
eventually killing the process with SIGALRM due to timeout.

Oliver, am I on the right track here? Is this really a bug in stress-ng?

(I still don't get why the throughput increases.)

Max
