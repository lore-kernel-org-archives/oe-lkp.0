Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D738835
	for <oe-lkp@lists.linux.dev>; Fri, 31 Mar 2023 17:57:44 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id ek18so92863337edb.6
        for <oe-lkp@lists.linux.dev>; Fri, 31 Mar 2023 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680285462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmoA6YUZCJuFE7TG8s09tRDr2zKD7Toe76fnRKIq27w=;
        b=iOODIYrIZGLMzRRQ4giuEPy71GwC4n2UIxhoqzMk+meAnxl0+zNRIvy1egioKNj4we
         WhhlRVx54EPg72PsASynoAjYTqRDzaO1roBh5rjzk+mYkTjmnsGtcI8hVqqVPYse87aP
         4SGZ0JfwhpaWsh6YNK6tk6F/Gayb7LSzvv42Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmoA6YUZCJuFE7TG8s09tRDr2zKD7Toe76fnRKIq27w=;
        b=72Q2aX0Yll6Z9/q/8u7z59WIK3Av9XxNX3SZNDmb4OPoJQV7JX0cFzaEcubv4t1tnj
         y9kxQbdjsGQgvGR4kfLhrjisSC+2DTuVn0VCY+v3jv7qzw6/8FUuHLZZj3l/cQvfteg+
         oxAMJiRWRFxBRpsItt8RHk1wwUwDBzprbbqP3CICLMO/lh32PcTkN9qv83U5GClrdhm6
         IlG5ETmvl3wxqxNQF1gtzdMlDU38Ic0dkKE7Fl++iWX7OuKFA1bDsthGKcOrnPNjaIxt
         HBwZrk9CKhVt+ceFlBaS4bznCvdOgSGUvChl+wUUKocrhcj3Tc0bN+L9GGyRyU3e/om1
         Pyiw==
X-Gm-Message-State: AAQBX9esfqA8Pq9gLBUnLx0C5v721md5o8Mj92dOToQNTse0wCAAJt5I
	jel3EbPCpv4S+d5HUIVUDhhyQlHis9tTLKJ1DVdLJA==
X-Google-Smtp-Source: AKy350ZIbsnkeKGox1a7BIKvbbfA6nSBybVyzJGJ6UilTXO/7W6Tqg60VuHJJzkDGujuFwAW08ovoQ==
X-Received: by 2002:a17:906:9748:b0:947:3330:c97e with SMTP id o8-20020a170906974800b009473330c97emr8693689ejy.71.1680285462598;
        Fri, 31 Mar 2023 10:57:42 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id jp12-20020a170906f74c00b00934212e973esm1194469ejb.198.2023.03.31.10.57.41
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 10:57:42 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id t10so92665438edd.12
        for <oe-lkp@lists.linux.dev>; Fri, 31 Mar 2023 10:57:41 -0700 (PDT)
X-Received: by 2002:a05:6402:5241:b0:502:6e58:c820 with SMTP id
 t1-20020a056402524100b005026e58c820mr4585387edd.1.1680285461441; Fri, 31 Mar
 2023 10:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303312259.441e35db-yujie.liu@intel.com>
In-Reply-To: <202303312259.441e35db-yujie.liu@intel.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Fri, 31 Mar 2023 10:57:15 -0700
X-Gmail-Original-Message-ID: <CABVzXA=+7wF4=NWxi0x57YSNs1Mpp7pJCODvyC6JRn9tQQAGLA@mail.gmail.com>
Message-ID: <CABVzXA=+7wF4=NWxi0x57YSNs1Mpp7pJCODvyC6JRn9tQQAGLA@mail.gmail.com>
Subject: Re: [linus:master] [selftests/memfd] 11f75a0144: kernel-selftests.memfd.run_fuse_test.sh.fail
To: Jeff Xu <jeffxu@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	David Herrmann <dh.herrmann@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 8:05=E2=80=AFAM kernel test robot <yujie.liu@intel.=
com> wrote:
>
> Hello,
>
> kernel test robot noticed kernel-selftests.memfd.run_fuse_test.sh.fail du=
e to commit (built with gcc-11):
>
> commit: 11f75a01448f1b7a739e75dbd8f17b844fcfc510 ("selftests/memfd: add t=
ests for MFD_NOEXEC_SEAL MFD_EXEC")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-d4cf28ee-1_20230110
> with following parameters:
>
>         group: group-02
>
> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>
> on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Sky=
lake) with 16G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> # selftests: memfd: run_fuse_test.sh
> # Aborted
> not ok 2 selftests: memfd: run_fuse_test.sh # exit=3D134
>
> $ ./run_fuse_test.sh
> opening: ./mnt/memfd
> 8 !=3D 40 =3D GET_SEALS(4)
> Aborted

Hi Jeff,

I think this is caused by test_sysctl() in memfd_test, which sets
/proc/sys/vm/memfd_noexec to a non-zero value and does not restore it
at the end of the test. If fuse_test runs after that, it will
unexpectedly get F_SEAL_EXEC in its memfd seals in addition to the
F_SEAL_WRITE that it intended to add.

I'm not sure how kernel selftests normally perform cleanup (e.g. an
atexit() hook to make sure it cleans up if a test fails?), but at
least we should probably set /proc/sys/vm/memfd_noexec back to its
original value after test_sysctl().

Thanks,
-- Daniel
