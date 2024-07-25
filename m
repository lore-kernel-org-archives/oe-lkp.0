Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398B172BAD
	for <oe-lkp@lists.linux.dev>; Thu, 25 Jul 2024 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721894859; cv=none; b=Rj7d4s7Rcmd4VGIf2iKta3G+zeFjpKF/trMOrfEnkM21VcsIVwAFMvLzbnFIjL4Q6zjle7G8boCEIy6xH/ldF8ubzM/mJm6WKG9MY3k5A1lttjioeD2IKQ+/PfqckNPn2q2dPlVAEG2OU9YanVcqr8PEppjtBo2T15s9UE72Nlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721894859; c=relaxed/simple;
	bh=r+M3o6SVfTD1vC9T28BpdhS5PBq7BQ34eYtryUx0Hug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSgU3sWsxsrhIJEJ9lChbXamY1eUSCXskTifU62ymf94PY7e5oC3wN/++0oIyTJUrzB8R3d2gYzUaV7GWxxcrFv7SddyVxqJkKBADD7gJko9ufbw8AUe7e8HDXcSLAla/Yx54RNZeJelJHsp7X9D1+j7tiEcFsAa/D3VttYXXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n089Gnp7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n089Gnp7"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a869e3e9dfso10013a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 25 Jul 2024 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721894856; x=1722499656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIQkCLUKnLONxhUVH4Hgod3J1H1l8mUYWFUy/48yoHk=;
        b=n089Gnp7AXjHcYd7LPTcuh2mNCEbQvGKguDMzyVAtHEkVRIGAHhD48UvDa0CJNWiq3
         YaG6dC0mJqwqPUchaOLd9SkP7ANTPHeZSsaScFK7+vgKzzvvEvrxAi94OEOaR26GuQTb
         BgQ4s9oZ23ZtUwUSi7Bq0dyLRD18RJbuBdLQtPhPkIRd+1oVzUPsDHPKMqp+2pYtARqI
         xsxk4gtwtfTOpgBjxWd1FJ1v7furu2fq5Pb1aPISvTe/rbBsqvzC5YFvuMgbwRnf/N00
         p/L56tKML6O5PnuHu5fNs/3d6I7rXvOyXlYKSENoE71NzHO7y4ovWTTGDKq22ZiPBuPD
         18Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721894856; x=1722499656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIQkCLUKnLONxhUVH4Hgod3J1H1l8mUYWFUy/48yoHk=;
        b=kpvhcO6oWlrjdZGKGVedd+ZzUlxtfIPh0Jt915amH3b1G0GtE+v2vZulWMrxuESmPl
         wa18yyt2OhqCjfJtJ/QIBqMRMDk1VVMDr+QbQMIvgvr6FKKYLw1YSki/juGequ+pJlYW
         6nh6q/0fA3Ea3SPrNl4CuV+bXQimh6SiTyjucoY3PBXgd10RGefhDq92HweLzl3fPJWZ
         3hQKVdmbwWMv5GKDX+hQFgi6ddQsrRdrvHCYBfK6u6o7AdzqsZPPhe05z1XcNocNGuGa
         5fnQ2EgrY727lkmRN9mxtmpMe9dsYKjmKVg/TC1/z7m4erd+BOlU0y54zuZPIHFwaYSh
         Y+zg==
X-Forwarded-Encrypted: i=1; AJvYcCUVUrJFLY4AQOzUg4lFmjgbr2XUAGdDxt8zUz96RME+LRDfsKxnxmGZY51/a/lBGWocSK7FzzIkKUpwPABJ+a6qGmiL3Lce
X-Gm-Message-State: AOJu0Yw5nJNpDwi+GjN11jashkTq6fGiRS9CPE3lzbrVNh6fcQrMPsJM
	9X9f4Ui5tUnd4r/60Sn2cgMhG0aTS6BFvI5fa2C/YmO2ko51uqsYq2gXWoJBKN2geL682vd52Fm
	cj6mo1I1NhLQ8Jk4R2mBX50KAfH5ZO0JqY5DV
X-Google-Smtp-Source: AGHT+IHl0LhuIwDpRoXa6gfrudcKM9vX8uhEq/AZ3MBhrUx8F2WnDsHvrrDN5URTN7HjWmm6RbPaMKgp4O++3+UyhG0=
X-Received: by 2002:a05:6402:2709:b0:5ac:4ce3:8f6a with SMTP id
 4fb4d7f45d1cf-5ac4ce391edmr123068a12.6.1721894855222; Thu, 25 Jul 2024
 01:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407251053.618edf56-oliver.sang@intel.com>
In-Reply-To: <202407251053.618edf56-oliver.sang@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 25 Jul 2024 10:07:21 +0200
Message-ID: <CANn89i+Bia9PdGhAVfRbbubYo37+g+ej68qp32JmU88tsLLuRQ@mail.gmail.com>
Subject: Re: [linus:master] [tcp] 23e89e8ee7: packetdrill.packetdrill/gtests/net/tcp/fastopen/client/simultaneous-fast-open_ipv4-mapped-v6.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 6:55=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "packetdrill.packetdrill/gtests/net/tcp/fastope=
n/client/simultaneous-fast-open_ipv4-mapped-v6.fail" on:
>
> commit: 23e89e8ee7be73e21200947885a6d3a109a2c58d ("tcp: Don't drop SYN+AC=
K for simultaneous connect().")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linus/master      68b59730459e5d1fe4e0bbeb04ceb9df0f00227=
0]
> [test failed on linux-next/master 73399b58e5e5a1b28a04baf42e321cfcfc663c2=
f]
>
> in testcase: packetdrill
> version: packetdrill-x86_64-31fbbb7-1_20240226
> with following parameters:
>
>
> compiler: gcc-13
> test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz=
 (Coffee Lake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> we also noticed other failed cases that can pass on parent.
>
>
> 42ffe242860c401c 23e89e8ee7be73e21200947885a
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/client/simultaneous-fast-open_ipv4-mapped-v6.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/client/simultaneous-fast-open_ipv4.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/client/simultaneous-fast-open_ipv6.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/basic-cookie-not-reqd_ipv4-mapped-v6.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/basic-cookie-not-reqd_ipv4.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/basic-zero-payload_ipv4-mapped-v6.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/basic-zero-payload_ipv4.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/opt34/basic-cookie-not-reqd_ipv4-mapped-v6.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/opt34/basic-cookie-not-reqd_ipv4.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/opt34/basic-zero-payload_ipv4-mapped-v6.fail
>            :9           67%           6:6     packetdrill.packetdrill/gte=
sts/net/tcp/fastopen/server/opt34/basic-zero-payload_ipv4.fail
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202407251053.618edf56-oliver.san=
g@intel.com
>
>
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/fastopen/client/simultan=
eous-fast-open.pkt (ipv6)]
>
> ...
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/fastopen/client/simultan=
eous-fast-open.pkt (ipv4)]
>
> ...
>
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/fastopen/client/simultan=
eous-fast-open.pkt (ipv4-mapped-v6)]
>
> ...
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240725/202407251053.618edf56-ol=
iver.sang@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

This has been discussed recently in netdev mailing list, one ACK will
get more precise information.
