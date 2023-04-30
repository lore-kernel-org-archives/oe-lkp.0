Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB242597
	for <oe-lkp@lists.linux.dev>; Sun, 30 Apr 2023 13:11:22 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f09b4a156eso8721665e9.3
        for <oe-lkp@lists.linux.dev>; Sun, 30 Apr 2023 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682860280; x=1685452280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T0O3OCgfohBjFWd6dpbocXqqi6G+Kp2YcM7Q1wup3D4=;
        b=A+8w6tG+z7GZffyGpo6XKiNkk4v4SePtj1l1VKpS2WZJE4OvlbshYBjOvoxLTF8O5s
         sGnJQ1QFC4ISkTTuFLpU/djCVp8bfEzg9neWNRprNgJgPoB2IwmS4tQvwhLUPgYHDceQ
         kssVV9kRRqz4wVpXQvrrN8821eX0WslxLxDOSUO2jt046abogSTfyC6l2CnSiBjy8VpM
         dF/UFaCw757JvGaSfOVU6e7f6RcQViepl0b/7NVHTfi1Fv/v/TDmk3czbX07ZTpzQ3yE
         aDWrJmzaRF6k41KOTmWk1Up1/1lssWPzIycRsbHYqSVy+CMNBqUHWGqCS2IiXI21v5g5
         VNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682860280; x=1685452280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0O3OCgfohBjFWd6dpbocXqqi6G+Kp2YcM7Q1wup3D4=;
        b=HqkJB7jjJW/MmRu4P5l66GpGr8QNdcAGIBmSWiX9SI+aUjwECvDAZP2aty4LEJQxEg
         xnF0DOu/dYDZzdb8ocV8rmni7VBHj0XlKa7BT31GXt3R4dlk2A8cRdA7JsW6SK7Klt9T
         GAFo02ObRnEBUmzjcrTkm16b0Olrjk2oEVx+bodTnvjd8UsWMyI3AoR0Ut1hbotmGK2g
         PmC7qssWeJdASaZd/MJQ5eHOkzJBzzBTNk8vApkg8cyr9JaO2Nhzhn4TmDBoK8oYMddS
         2NBMZWdgQmIbCIg9L9LjSu5MFp9qzqUiZLLQTSv+ECMbAGiVwUAL9M6QoTwK5uwBUG9W
         QELg==
X-Gm-Message-State: AC+VfDxrqsc1wOfZr70Yw4+GO6wRV5Gy5l2wWhfGU1dYsF357T9aPdH8
	02lNVPCCPG0eJ8xozfJB16rt3sEeW4fitg==
X-Google-Smtp-Source: ACHHUZ41QC2vemO2hdIKE7rbIhVilo/wYc9Qf7dzV6XlJjhobBRK/V2UX9BSeiLHo2u7TjmvV94O1w==
X-Received: by 2002:a7b:cc16:0:b0:3ed:f5b5:37fc with SMTP id f22-20020a7bcc16000000b003edf5b537fcmr8219782wmh.1.1682860280377;
        Sun, 30 Apr 2023 06:11:20 -0700 (PDT)
Received: from localhost ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.gmail.com with ESMTPSA id v11-20020a1cf70b000000b003f25b40fc24sm15277729wmh.6.2023.04.30.06.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 06:11:19 -0700 (PDT)
Date: Sun, 30 Apr 2023 14:11:19 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [linux-stable-rc:linux-6.2.y] [mm/mempolicy] 75cd8305a0:
 WARNING:at_mm/mmap.c:#vma_merge
Message-ID: <cf9f57eb-a657-4545-a430-1b0efe9a67de@lucifer.local>
References: <202304292203.44ddeff6-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304292203.44ddeff6-oliver.sang@intel.com>

On Sun, Apr 30, 2023 at 10:57:44AM +0800, kernel test robot wrote:
>
>
> Hello,
>
> kernel test robot noticed "WARNING:at_mm/mmap.c:#vma_merge" on:
>
> commit: 75cd8305a0bd360c3fedaefce1801c13b58e2311 ("mm/mempolicy: fix use-after-free of VMA iterator")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git linux-6.2.y
>
> in testcase: trinity
> version: trinity-static-x86_64-x86_64-f93256fb_2019-08-28
> with following parameters:
>
> 	runtime: 300s
> 	group: group-03
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> compiler: gcc-11
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202304292203.44ddeff6-oliver.sang@intel.com

[snip]

(resending email without the egregious quoting of the entire .config ,
apologies for that! :)

I have diagnosed this and submitted a patch which fixes it to mainline [1],
which should apply cleanly on backport.

Here is a reliable repro, should be built with -lnuma (forgive the messy
code, it can probably be pared down further from this):-

#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <numaif.h>

int main()
{
        const long page_size = sysconf(_SC_PAGESIZE);

        char *ptr = mmap(NULL, 5 * page_size,PROT_READ | PROT_WRITE,
                         MAP_ANON | MAP_PRIVATE | MAP_POPULATE, -1, 0);
        if (ptr == MAP_FAILED) {
                perror("mmap");
                return EXIT_FAILURE;
        }

        // Split into 5.
        if (mlock(ptr + page_size, page_size)) {
                perror("mlock 1");
                return EXIT_FAILURE;
        }

        unsigned long nodemask = 1;

        if (mbind(ptr, page_size * 2, MPOL_LOCAL, &nodemask, 1, 0)) {
                perror("mbind 1");
                return EXIT_FAILURE;
        }

        nodemask = 0;

        // Initialise ranges to be the same for first two pages.
        if (mbind(ptr, page_size * 2, MPOL_PREFERRED, &nodemask, 1, 0)) {
                perror("mbind 2");
                return EXIT_FAILURE;
        }

        // Now, try changing for full range.
        if (mbind(ptr, page_size * 4, MPOL_PREFERRED, &nodemask, 1, 0)) {
                perror("mbind 3");
                return EXIT_FAILURE;
        }

        return EXIT_SUCCESS;
}

[1]:https://lore.kernel.org/all/db42467a692d78c654ec5c1953329401bd8a9c34.1682859234.git.lstoakes@gmail.com/
