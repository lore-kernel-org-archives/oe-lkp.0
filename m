Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60737A53
	for <oe-lkp@lists.linux.dev>; Sat, 23 Sep 2023 05:56:40 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-656262cd5aeso19127726d6.3
        for <oe-lkp@lists.linux.dev>; Fri, 22 Sep 2023 22:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695448599; x=1696053399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYWvm/4SgJ1DnOwyE8GnR0KsTumSCWlYc7xSynW0xVM=;
        b=TeW8sICPVH/LmfJb/BrfFU28apwCOnfeHH4OdcTPf51fnBDH8I+NRHypKKZXSENGa6
         sLsSgLahCStg3CrZzUV2LFDPkftwOrLQQvI7EQE4yQvZfgiSozSp/H20QnarPWJgoSQm
         6NOUjRQRGSzfJfT3Ws4RRS4X2Z8+eUtSCgHgx+Te1FmcK22XwxkbgSknioz3Y/wFTJ74
         CJYUHU8YT6bezMzfq55k391CZFEFPR4UhTpHgjkY/j/Ry2QWDBNdG3IwgQ+EyQ5UVEZ3
         VQEWAqpJDeDDJPCf168sLm9ucm0SFDIGJ5HAps9IAIFT+ilvkZJCyvp6gP/hXtTH9snM
         DyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695448599; x=1696053399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYWvm/4SgJ1DnOwyE8GnR0KsTumSCWlYc7xSynW0xVM=;
        b=dbqE5AatxiasZpvtOo2CAvXscAFerxy7RBi9kMkblV4OXUp79YdGX/eDi3Fr3ZiKbX
         De+OBS5HMWZ7G/nMPgI078CA+ya4WFoEdAfw5YMklwcBM/Zu89wlue2ls7DhJkE4Klu2
         SQ9N1kU1EI0QN76KTox6dtYxvezWuRwH+MIDssb8fTNpySwdat2yCIYFMK6Uv9oHHCx1
         ZR7tX+F+OdkyoAEMeIeR7zZxRgL7osJ09cpBQKyvhhGCWImFQ12aTQSjvuDzO1uez3Tj
         miVdm9fUMMgEEujWH41wr4CHRfBUscBVUtM0AB46n4BOFOMpI9ippGYQ6FsCmvn0PZOm
         EilA==
X-Gm-Message-State: AOJu0YxCPTFS94ENadvze/Ad0bdpeSlx+sj3cz/ODDtvIydHwKL7S9Op
	fMcDf563dxvhd1Prx1X6ME6M2S1gvuM5mguxAcA=
X-Google-Smtp-Source: AGHT+IESwen9eFjqESJ1fXAsIxvoYG12qJbJ3e7iD8TUFnc0sKdccyFfxBxcSZoyX985pCpTNSBBQUk4P+HLUNlq+mw=
X-Received: by 2002:a0c:b253:0:b0:656:4af7:ab with SMTP id k19-20020a0cb253000000b006564af700abmr1238352qve.7.1695448599177;
 Fri, 22 Sep 2023 22:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230909043806.3539-1-reubenhwk@gmail.com> <202309191018.68ec87d7-oliver.sang@intel.com>
 <CAOQ4uxhc8q=GAuL9OPRVOr=mARDL3TExPY0Zipij1geVKknkkQ@mail.gmail.com>
 <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>
 <ZQ1Z_JHMPE3hrzv5@yuki> <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
In-Reply-To: <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 23 Sep 2023 08:56:28 +0300
Message-ID: <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
To: Reuben Hawkins <reubenhwk@gmail.com>
Cc: Cyril Hrubis <chrubis@suse.cz>, mszeredi@redhat.com, brauner@kernel.org, lkp@intel.com, 
	willy@infradead.org, linux-fsdevel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, viro@zeniv.linux.org.uk, oe-lkp@lists.linux.dev, 
	ltp@lists.linux.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 11:29=E2=80=AFPM Reuben Hawkins <reubenhwk@gmail.co=
m> wrote:
>
>
>
> On Fri, Sep 22, 2023 at 4:09=E2=80=AFAM Cyril Hrubis <chrubis@suse.cz> wr=
ote:
>>
>> Hi!
>> > ack.  Will try to test.  My Ubuntu 22.04 system wasn't able to find
>> > packages called
>> > for by the test case, so it'll take me a little while to figure out ho=
w to
>> > get the
>> > test case working...
>>
>> Huh? The test is a simple C binary you shouldn't need anything more
>> than:
>>
>> $ git clone https://github.com/linux-test-project/ltp.git
>> $ cd ltp
>> $ make autotools
>> $ ./configure
>>
>> $ cd testcases/kernel/syscalls/readahead
>> $ make
>> $ ./readahead01
>>
>> And this is well described in the readme at:
>>
>> https://github.com/linux-test-project/ltp/
>>
>> And the packages required for the compilation are make, C compiler and
>> autotools nothing extraordinary.
>>
> Awesome.  That was simpler than whatever it was I was trying.  I've
> reproduced the failed test and will try a few variations on the patch.

Cool.

For people that were not following the patch review,
the goal is not to pass the existing test.

We decided to deliberately try the change of behavior
from EINVAL to ESPIPE, to align with fadvise behavior,
so eventually the LTP test should be changed to allow both.

It was the test failure on the socket that alarmed me.
However, if we will have to special case socket in
readahead() after all, we may as well also special case
pipe with it and retain the EINVAL behavior - let's see
what your findings are and decide.

Thanks,
Amir.
