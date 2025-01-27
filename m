Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471AA135A63
	for <oe-lkp@lists.linux.dev>; Mon, 27 Jan 2025 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973208; cv=none; b=joL2eXe4iwoy/ipsqr5EcZh3H+bsjrUouzFpd2pElF+NPPvIai/uoh/C9sNv2iy0pr2PjDJ5+X0tHvAzUjCXW18nGeUfoLYhgr1BezYq8iVpKaP5wBjVEVLqiw9/z9tA5FfUB6fnaV1gWmD9LJU0FaWiRq822XyKDHKFdpJ3Jx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973208; c=relaxed/simple;
	bh=pHI8nT9tX06VZba+Qy/u+b6PysIrs2+wh1W6z+gCEaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJFttYfIxc6sNxL5XAn2+20o4lgezl9XC+EhhwzAwaIjapVlIyidtz1brU3lx2LU/uEA37SbG9cmxOcpUoWVW4C69fWmlQPzIhOkjct2wRbkndwTz1mHt0TIN+1NvIrAwUVeamDOv9gRBIWzLeiPOIuoWJMm9kMtNZy4N1SOK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuvsHGVW; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuvsHGVW"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3cfdf302014so9994905ab.3
        for <oe-lkp@lists.linux.dev>; Mon, 27 Jan 2025 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737973206; x=1738578006; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sckdr71MrnKjBSWxkzb932HcRLBhiMEG/B2/474sLNA=;
        b=UuvsHGVWLIeBhW0JN/Af2uLeQYMckqTkbCj7Nz92+f+D4uNPY6j7z0eTBOhfyFkby+
         APEBOmGR7DOSdmkgecYMYq+R313djxoqV4fvdXhnJ9yElNkBGRGu1PVIlszbEnrBvmBh
         RLXDGLk6pAEgpLwodTwsmMlLmVyRc+5VpuIv4MqvZyFwG13JLYaIaqAX87bszX8jjcd4
         Z78fZxoU3lB0VTX+3l9aoAXKOFBAug3lrNCux1YgCboHAlO6VJxHBgTTPAFZG9oyQ1GP
         2hrJ+F89yBcCCp0CBRYtUPxrDZ/88L6P4SDEd5918D4DyDmZvOEuJsJtWLQZmZVu+MQN
         BrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737973206; x=1738578006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sckdr71MrnKjBSWxkzb932HcRLBhiMEG/B2/474sLNA=;
        b=FFzr2l1txYiQOXjc8h7K8Mdekdti2FdLccYCKXRwE/2kkulzbRWwo+OsZMAN7rQPGw
         GefSNFCuzXZD1DIpTvKn3Q9D6ngelqhfaJe5tT7J0oeo0s7JxmPtpsUrGhUytx0aYz9m
         //VeH5n9PTR9M1q9C7SIDawwlC2VRcR2CxDL4HZjma11O0ws1S2QqmY0cukeIlYxIs0I
         eH0fd7/eRDu+v6LfpqK1J02Beyv9X9G3C3Ak2/YUltRtn6NRwSrEpY2NgDA5P8O+NZOO
         QJSXQgZUGlEyUcY+fi/GS2metMRn8GHa4wSR9MABxVxIglz7NFceZQlXh3ABNJGeWp4S
         pIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAToCAOHe6VB52yCHLrvW4MKLIdmyJyw/f3X9e+Hx8yxia+1bMreKCpFfNyKE6NCIg/8XQBgs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRBJJybzCDkwe5W16PKHqf6xmscmp2JcQsM54JduoAf4HnqCED
	ybG98hMdZVxE+DV2SHeZrn4VgxKFIXpFsHVgS6396Tzz4s8evWj7KqI/mT513zotKMlTqALvcFe
	nvkD+8QuecCzqL7Oe29RL9IXPS0k=
X-Gm-Gg: ASbGncsrhvfttIFhFHqFCrBOSAbLJjtO8lDF1rL+TvsuS1+xj2KWycaRmfV4ouBbyv1
	EoDieRYjnqX+LXb/7GRtUDnngJ7r/0N9+KeSo20A/ubMr9m/G98EGUJ4LLAzsSctV9TvkS3h+
X-Google-Smtp-Source: AGHT+IH+oQffYDjVTEsZUgquRRYzcp2aVY/U1Tlc+chFH/eaQzlzqpFS/VT0LzpDx9GoCkmkV/XiWPmeS0X2EUnCIu4=
X-Received: by 2002:a05:6e02:16cb:b0:3cf:cdb8:78fb with SMTP id
 e9e14a558f8ab-3cfcdb87ac6mr90820885ab.16.1737973206316; Mon, 27 Jan 2025
 02:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501261315.c6c7dbb4-lkp@intel.com> <CAL+tcoBBjLsmWUt9PkzDhVtGLm-s53EyTzcHhpTkVnLpgz0FXw@mail.gmail.com>
In-Reply-To: <CAL+tcoBBjLsmWUt9PkzDhVtGLm-s53EyTzcHhpTkVnLpgz0FXw@mail.gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 27 Jan 2025 18:19:30 +0800
X-Gm-Features: AWEUYZkHEbWK10UcMluPXye9arxpRxbeEpiKlDFBBrcOJIjVFyWB1-42gpACmvM
Message-ID: <CAL+tcoBmRVKUfhR8DiMryD4h5ZJeQpGuhPyzK3fexiEBvE_KDA@mail.gmail.com>
Subject: Re: [linus:master] [tcp_cubic] 25c1a9ca53: packetdrill.packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: Mahdi Arghavani <ma.arghavani@yahoo.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Neal Cardwell <ncardwell@google.com>, Eric Dumazet <edumazet@google.com>, 
	Haibo Zhang <haibo.zhang@otago.ac.nz>, David Eyers <david.eyers@otago.ac.nz>, 
	Abbas Arghavani <abbas.arghavani@mdu.se>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2025 at 4:49=E2=80=AFPM Jason Xing <kerneljasonxing@gmail.c=
om> wrote:
>
> On Sun, Jan 26, 2025 at 2:30=E2=80=AFPM kernel test robot <oliver.sang@in=
tel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed "packetdrill.packetdrill/gtests/net/tcp/cubic=
/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail" on:
> >
> > (
> > in fact, there are other failed cases which can pass on parent:
> >
> > 4395a44acb15850e 25c1a9ca53db5780757e7f53e68
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4.fail
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv6.fail
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/cubic/cubic-bulk-166k_ipv4-mapped-v6.fail
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/cubic/cubic-bulk-166k_ipv4.fail
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/cubic/cubic-bulk-166k_ipv6.fail
>
> Thanks for the report. I remembered that Mahdi once modified/adjusted
> some of them, please see the link[1].
>
> [1]: https://lore.kernel.org/all/223960459.607292.1737102176209@mail.yaho=
o.com/
>
> I think we're supposed to update them altogether?

Should the updated pkt scripts target net or net-next tree, BTW?

Thanks,
Jason

>
> Thanks,
> Jason
>
> > )
> >
> > commit: 25c1a9ca53db5780757e7f53e688b8f916821baa ("tcp_cubic: fix incor=
rect HyStart round start detection")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > [test failed on linus/master      405057718a1f9074133979a9f2ff0c9fa4a19=
948]
> > [test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b=
183]
> >
> > in testcase: packetdrill
> > version: packetdrill-x86_64-8d63bbc-1_20250115
> > with following parameters:
> >
> >
> > config: x86_64-rhel-9.4-func
> > compiler: gcc-12
> > test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40G=
Hz (Haswell) with 8G memory
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202501261315.c6c7dbb4-lkp@inte=
l.com
> >
> >
> >
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-=
idle-restart.pkt (ipv4-mapped-v6)]
> > stdout:
> > 20
> > 30
> > 36
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-=
idle-restart.pkt (ipv6)]
> > stdout:
> > 20
> > 30
> > 36
> > stderr:
> >
> > ...
> >
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-=
idle-restart.pkt (ipv4)]
> > stdout:
> > 20
> > 30
> > 36
> > stderr:
> >
> > ...
> >
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k.=
pkt (ipv4)]
> > stdout:
> > 20
> > 30
> > 36
> > stderr:
> >
> > ...
> >
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k.=
pkt (ipv4-mapped-v6)]
> > stdout:
> > 20
> > 30
> > 36
> > stderr:
> >
> > ...
> >
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k.=
pkt (ipv6)]
> > stdout:
> > 20
> > 30
> > 36
> > stderr:
> >
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20250126/202501261315.c6c7dbb4-=
lkp@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
