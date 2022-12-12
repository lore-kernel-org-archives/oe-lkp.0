Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CA2585
	for <oe-lkp@lists.linux.dev>; Mon, 12 Dec 2022 13:09:45 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id j26so4572020vsp.9
        for <oe-lkp@lists.linux.dev>; Mon, 12 Dec 2022 05:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfSNgM+0twrLLGfHzA5jy5Kw8VIHD18ejk8+Mb6CtJ0=;
        b=rYO3dJiJZOs+iJnATRiTkZhoadeFr62QwF4jBPS+moNgk1+RvtCFy/duXZHHE+6KKl
         yJQWuFALXyAszzU3rFHaN+rQKQVVUXYj/Zr4MPAj86J+leVP78vM32l1KgpDxYeAzQUB
         f79Arx8T1FezwmX73lqCtsSEYF6SWlvPTloTcstnTWRv4v4wOL8sOA1gpjbu+rWan4zv
         BzpIe5cQBSN5pxvUQr8wHpqVLSYVG3T3Ii1i2wY07LEKRm0uL17JVt6iGCxyUyqhJmCo
         Z1NaWIfgI5pwS6LS6XzgXFari/y0gNDOPeh5LqweLqZrc9UZ8DbmrllmS7dLWRLrEMoZ
         JGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfSNgM+0twrLLGfHzA5jy5Kw8VIHD18ejk8+Mb6CtJ0=;
        b=VRl0VnhYU8KqQloC8oWoNXVCgBJLOehPOmE4QF+vGLq39SCBIuSCXs6/fTr8PIhZis
         cp35VsHxqlUV2RXIYTWhwy25GYkezyxP7tU+ieBqKB30MU1rQQXnBBxcgCrlAYEckLnW
         YHepu73MEAoqzsa/5ElX/WrQAH9kAb3HldMWZ4uHxXaKETct+65NuzdRiOYhz2qCOJa5
         ujRIC2Wl4U8z2kNovuY+je4uZyyZOyXxWrp7rrpPmySe0c3VuufazSjOuuAhAXtkIBBk
         agDRYpIO6fqt1IsQ3IEG+k2bUFaztCoJE5+Xwt/8wosA40PzNwbDy4JftFhtnVfgCcTd
         jQ0g==
X-Gm-Message-State: ANoB5pm9IB6906WzqcI89aDKqVs/fLMrTZUw+L/fofReUINTcOD83CQH
	vqFSEH5akO7R4Rcf9MK9Xs4zOi71XUQozUoRd6JYHA==
X-Google-Smtp-Source: AA0mqf4K403z6dN136I2BMaYSifIt4AdRVsBbWxuNKvguf08JE8WKXwBSQ934w1A60y7X2W/uPzbLP6YgZQyH/KWFgs=
X-Received: by 2002:a67:fc4b:0:b0:3b1:298c:45f9 with SMTP id
 p11-20020a67fc4b000000b003b1298c45f9mr12621504vsq.61.1670850584104; Mon, 12
 Dec 2022 05:09:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212112236.756f5db9-oliver.sang@intel.com>
In-Reply-To: <202212112236.756f5db9-oliver.sang@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Dec 2022 14:09:33 +0100
Message-ID: <CAMRc=Meh-u3ZoMksKs8Hf89gJ=wRaFNdCaeWfXNS13Fu6fs9bA@mail.gmail.com>
Subject: Re: [linux-next:master] [gpiolib] 7b61212f2a: kernel-selftests.gpio.gpio-sim.sh.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 11, 2022 at 4:08 PM kernel test robot <oliver.sang@intel.com> wrote:
>
>
> Greeting,
>
> FYI, we noticed kernel-selftests.gpio.gpio-sim.sh.fail due to commit (built with gcc-11):
>
> commit: 7b61212f2a07a5afd213c8876e52b5c9946441e2 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master f925116b24c0c42dc6d5ab5111c55fd7f74e8dc7]
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-2ed09c3b-1_20221128
> with following parameters:
>
>         group: group-01
>
> test-description: The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>
>
> on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202212112236.756f5db9-oliver.sang@intel.com
>
>
> # selftests: gpio: gpio-sim.sh
> # trap: SIGTERM: bad trap
> # 1. chip_name and dev_name attributes
> # 1.1. Chip name is communicated to user
> # 1.2. chip_name returns 'none' if the chip is still pending
> # 1.3. Device name is communicated to user
> # 2. Creating and configuring simulated chips
> # 2.1. Default number of lines is 1
> # 2.2. Number of lines can be specified
> # 2.3. Label can be set
> # 2.4. Label can be left empty
> # 2.5. Line names can be configured
> # 2.6. Line config can remain unused if offset is greater than number of lines
> # 2.7. Line configfs directory names are sanitized
> # 2.8. Multiple chips can be created
> # 2.9. Can't modify settings when chip is live
> # 2.10. Can't create line items when chip is live
> # 2.11. Probe errors are propagated to user-space
> # Probe error was not propagated
> # GPIO gpio-sim test FAIL
> not ok 2 selftests: gpio: gpio-sim.sh # exit=1
>
>

Just sent out a fix.

Bart
