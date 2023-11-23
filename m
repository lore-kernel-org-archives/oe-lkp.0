Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CB733CD6
	for <oe-lkp@lists.linux.dev>; Thu, 23 Nov 2023 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFKfdxty"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-66d0760cd20so8436226d6.0
        for <oe-lkp@lists.linux.dev>; Thu, 23 Nov 2023 08:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700755490; x=1701360290; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yQnyP3lCf9W9/RzEaMbYWk0BN0vqCDasa+jrY8TA+c=;
        b=mFKfdxtyKfTJ+tq1zj9YN7EYxyBwc7ketyM8Mi9wDa01Ul866G4vb/IjLywOXTkJs6
         0bfsb+rx4m4q3XqIqnBA29KC5siEWDI2CG+t59K69vnmIHmjSdd7uJPZngi6wAF9vL6E
         M7xYetWwVLIUKI8It7xUndx91QDA0gD4GGX7mK0XYObbmu1VbWz3jRSHHayu3jknFMR5
         BHiOJFbXV0rqlbWElaAmPnmHIIb7kulO+wQofp06Ohh44LpDoapSx79zsrMt3ExJU74R
         nvsVnECTndZwfbpExmvMisnJDAxLH5/mYyh1u3aP2IDbmDNvmumYCNZ9/ZgS8tD61FxN
         hvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755491; x=1701360291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yQnyP3lCf9W9/RzEaMbYWk0BN0vqCDasa+jrY8TA+c=;
        b=Mu5DqM22yQTyMcmsARlW1axY9EpWWHyIi9U138F+eQjqH+bMqSe9j9zgxEgL4EI3hV
         bHBUKQfQ1vGC1dhOwrshSGE0eQYw3XO7ibljHXkxAPI7Je4gqk1VbRgovBlwEtGVPX00
         zSduV07gDbb/ohn/ekQkJ8y48VZJQFLmHHGuvL7nbwQqXjpAhmLEWTsHPJ4vQXg9OB9+
         QTHpO/Cs8ky1gsG9BCib+56r5A1qSQOo9lbsq2urus02X2A5vXFmbcqgrLcNe7YsXZxp
         XH6AxhqeRem+c2JhbghBtGgxxw9+MNB0pjnYmZv5GQlOwClsRfTG3MMd6gQ4Q50rZGKR
         EmuA==
X-Gm-Message-State: AOJu0YxLqxc6vKMIRtJPe7Z+29FKeRjyaKk83OFSs8jSsiILdRdHDWFC
	ooIR3dqDizdKMJuvg97qX5Uyp+e/Jay38zBy984=
X-Google-Smtp-Source: AGHT+IGVgpHEBcYaZoH59KOLrdA7VOcrUJSyNt6HloOCBc85rpUf51a6gqYPgLwoRAb6u4WDNDUpZKTi879E9c2TCk8=
X-Received: by 2002:a0c:ef42:0:b0:67a:bde:8898 with SMTP id
 t2-20020a0cef42000000b0067a0bde8898mr1865573qvs.5.1700755490737; Thu, 23 Nov
 2023 08:04:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311231356.1e1fb71f-oliver.sang@intel.com>
In-Reply-To: <202311231356.1e1fb71f-oliver.sang@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 23 Nov 2023 17:04:39 +0100
Message-ID: <CA+fCnZd2JKZP43UJLciKOx2pRVwWDEUJZ0ik_BYC5atnwUGSfg@mail.gmail.com>
Subject: Re: [linux-next:master] [kasan] 0e8b630f30: BUG_kmem_cache_node(Tainted:G_T):Poison_overwritten
To: kernel test robot <oliver.sang@intel.com>
Cc: Andrey Konovalov <andreyknvl@google.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Evgenii Stepanov <eugenis@google.com>, Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 7:19=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
> kernel test robot noticed "BUG_kmem_cache_node(Tainted:G_T):Poison_overwr=
itten" on:
>
> commit: 0e8b630f3053f0ff84b7c3ab8ff98a7393863824 ("kasan: use stack_depot=
_put for Generic mode")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 07b677953b9dca02928be323e2db853511305fa=
9]
>
> in testcase: boot
>
> compiler: clang-16
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +--------------------------------------------------------------+---------=
---+------------+
> |                                                              | 882f84db=
75 | 0e8b630f30 |
> +--------------------------------------------------------------+---------=
---+------------+
> | BUG_kmem_cache_node(Tainted:G_T):Poison_overwritten          | 0       =
   | 55         |
> | BUG_kmem_cache_node(Tainted:G_B_T):Poison_overwritten        | 0       =
   | 55         |
> +--------------------------------------------------------------+---------=
---+------------+

This should be fixed by "slub, kasan: improve interaction of KASAN and
slub_debug poisoning" and the most recent version of "kasan: Improve
free meta storage in Generic KASAN".
