Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA717737
	for <oe-lkp@lists.linux.dev>; Fri, 30 Jun 2023 20:17:37 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7943bfaed0dso851329241.0
        for <oe-lkp@lists.linux.dev>; Fri, 30 Jun 2023 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688156256; x=1690748256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+gz3rbM0OY902Y4of6wRP2HS5VbT/U7AQ8PgE4aekU=;
        b=FZwDlwv4ffb0sJT3CPooG8WF8CvDEjkDZOTxw2YhQkqZiJKau4CiIxJq06l7Cl4euf
         lODCdA5ZKYxiQEc79c4JpVoZ24ewhBCoVtJsjG/IX7mYuksMMbf8MtsmyDiHbLVCvHrV
         Q1GrSxEneOUpc+sU1zHS2Rr/a3zD2/zXL1anDYxmd9oLLEAgVZmRrpbv2mHSBZPyulyz
         bchhJNxfJeuhB1BZPH/KocC9PcD1WTeeoDc2eNQEVqlHI+0ygbxJk6cr5TDNbwP9B7Ks
         mc72PFI+MORPWK6liqp+ADVxPOlJOYjxEXuq/3RW5f1ZC3bQTTfnBhG+IQ/6rx3LQItu
         d2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688156256; x=1690748256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+gz3rbM0OY902Y4of6wRP2HS5VbT/U7AQ8PgE4aekU=;
        b=ble74iP+XcYDtA1P2xueC6rJ6GSf90sssCu6hjmJU19tSvs3BfvYUc1HdsEJNW0j68
         VqIyJrUB+6p/fi5m2MepprSLmDhJ6omZZRfNXTVXuZvytkON6vNMUPgw3dnbaSawynYp
         Ce/bHA7e6C7+g/JXjOQcrNtfQZYjLm0CmgsqvbIsMBG68TjErbyrrmQ5KrHJxXheAqVn
         /lt8YVLILp4Vve+kzHZYsnD9ios6oPMnEw3ZyhSDVNRi0RFZwuKRabm8KIvdQcUwU4pQ
         vmyY34P6QiRoa327yKC7F1s6yCoJVk3Y4Y/AcYYwm2ZZSt+74iKjFcPdbhfh9U39F3QW
         Jsrw==
X-Gm-Message-State: ABy/qLYNwEdH86aXu+2XvqGffrS0/mCTVSrcAqq3rlEn3+1zsMImFGW2
	YLjQVEaHsE720ldA46EG8OK0UPXvZMcZgc92ZSZPSqvf
X-Google-Smtp-Source: APBJJlFzcMpCjN21Us/T8pUPSVXDQ9r1Er4h7DDFzk0Rgo+yChDsRB9LxI0EvQNDKct/RSr0EjVbkU5W9aCliWwAaSU=
X-Received: by 2002:a67:e208:0:b0:443:64fb:8ec1 with SMTP id
 g8-20020a67e208000000b0044364fb8ec1mr2745696vsa.21.1688156256493; Fri, 30 Jun
 2023 13:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306291538.42b0d51e-oliver.sang@intel.com>
In-Reply-To: <202306291538.42b0d51e-oliver.sang@intel.com>
From: jim.cromie@gmail.com
Date: Fri, 30 Jun 2023 14:17:10 -0600
Message-ID: <CAJfuBxwm5xmcjSOvsPMT0WPQNygRzCe4M-uoHQWdUoQcq+aPhg@mail.gmail.com>
Subject: Re: [jimc:dyn-drm-trc-10] [dyndbg] abcc1779bc: BUG:kernel_NULL_pointer_dereference,address
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 7:50=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" o=
n:
>
> commit: abcc1779bc9e90e1ae4e295330313cdf7503ef01 ("dyndbg: add 2 trace-ev=
ents: drm_{,dev}debug")
> https://github.com/jimc/linux.git dyn-drm-trc-10
>
> in testcase: boot
>
> compiler: gcc-12
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +---------------------------------------------+------------+------------+
> |                                             | be9b03fca4 | abcc1779bc |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 19         | 0          |
> | boot_failures                               | 0          | 18         |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 18         |
> | Oops:#[##]                                  | 0          | 18         |
> | EIP:__drm_dev_dbg                           | 0          | 18         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 18         |
> +---------------------------------------------+------------+------------+
>

Hi Oliver,

I recall finding an old email (Feb?) from you along these lines,
and cuz I didnt answer (in time or at all), you eventually blocked a
branch from building
apparently cuz it wedged your test-system rather more than a compile-fail.

I'll push something fresh there, that should take the bad commit off
your build list
