Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5033D63
	for <oe-lkp@lists.linux.dev>; Fri, 31 Mar 2023 18:48:35 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id le6so22106732plb.12
        for <oe-lkp@lists.linux.dev>; Fri, 31 Mar 2023 11:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680288515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha0y1aVGGlKryyACSylfRfMiUopPmFx0UKtPGVQ010A=;
        b=dG65J7A4VVcqDAMEt/KHhdXENN8I5sFeiwg0aBjxIt6HSSCB18H3F99Oo7WyyJ6PU1
         ThxkRfrhTkLyalsHdj6HBZwOyFSdUgW8Ae6MAT3bKoxKRURQoqRY0yBR2cXtpXHkNpia
         ZIJ3r97rTNQYZl0h5hCIVASmnfyq7XNL7LewtRUICU1sXvuc7nBt7Q5UBKdR4ZhUQN4r
         M1IFYkSIeE5OhY15+XPmRafUGEHNNC59WzUgAqYKlfX++xNH20PYXaDI1x/LXndvrvXo
         C4gdXS4dDeshQkapddOG+7Qezzgt/4TFF/Mn/YQeTfhEHtnohOhyvQUKPQt2fLORvbkR
         m+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680288515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha0y1aVGGlKryyACSylfRfMiUopPmFx0UKtPGVQ010A=;
        b=yan+XkgM1kk9pcFonGt5r/BpCo2sVpBMFlec5SbS2ZL2qvH6Wpt1acbVsLamxVOTPL
         w/YClW++i0K8Hi6N3n5YDGv3YQ58YsWDW8I3hwHcVNMw8+QS01yE1vL+oISwosJS8KIv
         dTxCeVaOVotmnHyBQEvFSuePaLKrjywK0OifTgYMlDOCXLIT7hKv26GvJkYU7BOwUSuu
         ThCiWPhEcdcuRht+o4sjrjdlBSGYW6W7LsbtNsxfLuFGMkeX2dKxb90W9dr4j/QgI8ev
         mYL/j5glRHqL5jVDH97ftT8+F11ADFDf/3Pk+C7iqJSKd+Jp7QB8WOsV+iYHgHL49JZk
         Un/Q==
X-Gm-Message-State: AAQBX9evGEkh9TO9DNA69zU+QLClojhJlQjDhaWDiOONOnKHteQn8B07
	GzW0dIHFazJait6sbVeD8YV+PLldQv/dG5Oeo3/zAA==
X-Google-Smtp-Source: AKy350Y/Lf2dCfi5UPTpbKVKc+6vTRtA4W694ps03YfOsv3zY1TjGM/sDdzAfOi/2xhGi26H88Yj/rnB8ijgSU8pQDE=
X-Received: by 2002:a17:902:8f8f:b0:19a:64f6:e147 with SMTP id
 z15-20020a1709028f8f00b0019a64f6e147mr3865059plo.2.1680288515105; Fri, 31 Mar
 2023 11:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303312259.441e35db-yujie.liu@intel.com> <CABVzXA=+7wF4=NWxi0x57YSNs1Mpp7pJCODvyC6JRn9tQQAGLA@mail.gmail.com>
In-Reply-To: <CABVzXA=+7wF4=NWxi0x57YSNs1Mpp7pJCODvyC6JRn9tQQAGLA@mail.gmail.com>
From: Jeff Xu <jeffxu@google.com>
Date: Fri, 31 Mar 2023 11:47:58 -0700
Message-ID: <CALmYWFvXuQGuHHm9s5YAvG2VC1b3T+vu29xUYpKgWp6fmeUGaA@mail.gmail.com>
Subject: Re: [linus:master] [selftests/memfd] 11f75a0144: kernel-selftests.memfd.run_fuse_test.sh.fail
To: Daniel Verkamp <dverkamp@chromium.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	David Herrmann <dh.herrmann@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,
Thanks for initiating the analysis.

On Fri, Mar 31, 2023 at 10:57=E2=80=AFAM Daniel Verkamp <dverkamp@chromium.=
org> wrote:
>
> On Fri, Mar 31, 2023 at 8:05=E2=80=AFAM kernel test robot <yujie.liu@inte=
l.com> wrote:
> >
> > Hello,
> >
> > kernel test robot noticed kernel-selftests.memfd.run_fuse_test.sh.fail =
due to commit (built with gcc-11):
> >
> > commit: 11f75a01448f1b7a739e75dbd8f17b844fcfc510 ("selftests/memfd: add=
 tests for MFD_NOEXEC_SEAL MFD_EXEC")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > in testcase: kernel-selftests
> > version: kernel-selftests-x86_64-d4cf28ee-1_20230110
> > with following parameters:
> >
> >         group: group-02
> >
> > test-description: The kernel contains a set of "self tests" under the t=
ools/testing/selftests/ directory. These are intended to be small unit test=
s to exercise individual code paths in the kernel.
> > test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> >
> > on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (S=
kylake) with 16G memory
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> > # selftests: memfd: run_fuse_test.sh
> > # Aborted
> > not ok 2 selftests: memfd: run_fuse_test.sh # exit=3D134
> >
> > $ ./run_fuse_test.sh
> > opening: ./mnt/memfd
> > 8 !=3D 40 =3D GET_SEALS(4)
> > Aborted
>
> Hi Jeff,
>
> I think this is caused by test_sysctl() in memfd_test, which sets
> /proc/sys/vm/memfd_noexec to a non-zero value and does not restore it
> at the end of the test. If fuse_test runs after that, it will
> unexpectedly get F_SEAL_EXEC in its memfd seals in addition to the
> F_SEAL_WRITE that it intended to add.

The sysctl for /proc/sys/vm/memfd_noexec is pid-namespaced, and designed to
be non-reservable due to security reasons.

I think the fix is to run this set of test_sysctl in a child
namespace, instead of init namespace.
I will work on a fix for this.

> I'm not sure how kernel selftests normally perform cleanup (e.g. an
> atexit() hook to make sure it cleans up if a test fails?), but at
> least we should probably set /proc/sys/vm/memfd_noexec back to its
> original value after test_sysctl().
>
> Thanks,
> -- Daniel

Thanks!
-Jeff

-Jeff
