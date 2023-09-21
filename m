Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3EBBA3E
	for <oe-lkp@lists.linux.dev>; Thu, 21 Sep 2023 14:44:22 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7a29ef55d5fso461026241.3
        for <oe-lkp@lists.linux.dev>; Thu, 21 Sep 2023 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695307462; x=1695912262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFaHfoaxn08xsAqYV/UBPB0BsJ0aDfd3cBl6EMbcNgw=;
        b=Og7RC2pUnJpsyCjKS9xqzapzxSQeXXcVSW+xh70XDmeeBwCxxssVyS65Msiytu0RVV
         YSh8qvpeq+f+SkSVIbInwitAGS5AcVnvqM+RzEYFPgxdQGZZ6aeUF/OHtqsVQIeHQU1S
         KaLTN3DxYtsZI5dDkhyNErxn6SvB4EOFn4v4hG9EVGFK5zQ3aKmKpD0HN8eBOuGlsKLm
         tyRlNFNKwEWX/L+Ur/rWaNcLQ2EZVPLUIWHYvdhTer+LYW2uhvZX7/h1Kc1luJ7fVL2J
         wCouKwbTX05NH/1Mb0pdj0Wa5GwgYCIVbfFGBpW4pUu1QYshq/WRQ3oPMg9zzNFFLFrM
         B3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307462; x=1695912262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFaHfoaxn08xsAqYV/UBPB0BsJ0aDfd3cBl6EMbcNgw=;
        b=rOymTqj9wjCmR+JoKOZf/Adw0FKwD1pImbs7HTMkQVm4et6NVuhcH+4hViWTTxNrVc
         xw8C2QdBaqEgV99Hf6ci5AtsB4T2T38v9A9QX6iurllf6pUu4GUhmLwAjPSa2CKjzdQU
         xAdazuOzrXCO6wYkMs8XeMal0F5onSylTlvGoRW9uI+KkDB5JVVJwa10wE6l31lEYmLM
         +BCRuvfFURGmTRXsChG93xMzey2idBJsJrWqqtjqe30mtcoLr/akAGl9XeV+lP4SKnL7
         d7Li5i8XS1XzmCtAerRmw5nnnwqqjHWaB0G0MKdEXIbteZaiE56bEDsZro8uIgGEUSHL
         9UOw==
X-Gm-Message-State: AOJu0Yz9ENkF9wNk2gTxG+0KItgn/Cr1Gz2Xwnnrz9AdX4dbh9Ab9Ahc
	d/tYuszmabZoc65EAB815FoJlGJZa8e85rBo/VE=
X-Google-Smtp-Source: AGHT+IEX0oUA/m6qcydkc/MWRxmpvID/DRX9SY5OT+po1vq9MZCQuVXYDV3BHR9AxQnZho/TDPq2BuQ2cxuIIY5YALM=
X-Received: by 2002:a67:e8da:0:b0:452:988c:f339 with SMTP id
 y26-20020a67e8da000000b00452988cf339mr5582120vsn.5.1695307461687; Thu, 21 Sep
 2023 07:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230909043806.3539-1-reubenhwk@gmail.com> <202309191018.68ec87d7-oliver.sang@intel.com>
 <CAOQ4uxhc8q=GAuL9OPRVOr=mARDL3TExPY0Zipij1geVKknkkQ@mail.gmail.com> <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>
In-Reply-To: <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 21 Sep 2023 17:44:10 +0300
Message-ID: <CAOQ4uxj7-=pU_WR8PbV4QUK=cepZnmd_1eCqRcwthJNkkzA5VA@mail.gmail.com>
Subject: Re: [PATCH] vfs: fix readahead(2) on block devices
To: Reuben Hawkins <reubenhwk@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-fsdevel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, ltp@lists.linux.it, mszeredi@redhat.com, 
	willy@infradead.org, viro@zeniv.linux.org.uk, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 4:01=E2=80=AFPM Reuben Hawkins <reubenhwk@gmail.com=
> wrote:
>
>
> On Tue, Sep 19, 2023 at 3:43=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
>>
>> On Tue, Sep 19, 2023 at 5:47=E2=80=AFAM kernel test robot <oliver.sang@i=
ntel.com> wrote:
>> >
>> >
>> >
>> > Hello,
>> >
>> > kernel test robot noticed "ltp.readahead01.fail" on:
>> >
>> > commit: f49a20c992d7fed16e04c4cfa40e9f28f18f81f7 ("[PATCH] vfs: fix re=
adahead(2) on block devices")
>> > url: https://github.com/intel-lab-lkp/linux/commits/Reuben-Hawkins/vfs=
-fix-readahead-2-on-block-devices/20230909-124349
>> > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git =
32bf43e4efdb87e0f7e90ba3883e07b8522322ad
>> > patch link: https://lore.kernel.org/all/20230909043806.3539-1-reubenhw=
k@gmail.com/
>> > patch subject: [PATCH] vfs: fix readahead(2) on block devices
>> >
>> > in testcase: ltp
>> > version: ltp-x86_64-14c1f76-1_20230715
>> > with following parameters:
>> >
>> >         disk: 1HDD
>> >         fs: ext4
>> >         test: syscalls-00/readahead01
>> >
>> >
>> >
>> > compiler: gcc-12
>> > test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30=
GHz (Ivy Bridge) with 8G memory
>> >
>> > (please refer to attached dmesg/kmsg for entire log/backtrace)
>> >
>> >
>> >
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <oliver.sang@intel.com>
>> > | Closes: https://lore.kernel.org/oe-lkp/202309191018.68ec87d7-oliver.=
sang@intel.com
>> >
>> >
>> >
>> > COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 3917     -n 3=
917 -p -f /fs/sdb2/tmpdir/ltp-R8Bqhtsv5t/alltests -l /lkp/benchmarks/ltp/re=
sults/LTP_RUN_ON-2023_09_13-20h_17m_53s.log  -C /lkp/benchmarks/ltp/output/=
LTP_RUN_ON-2023_09_13-20h_17m_53s.failed -T /lkp/benchmarks/ltp/output/LTP_=
RUN_ON-2023_09_13-20h_17m_53s.tconf
>> > LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2023_09_13-20h_17m_53=
s.log
>> > FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2023_09_13-=
20h_17m_53s.failed
>> > TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2023_09_13-2=
0h_17m_53s.tconf
>> > Running tests.......
>> > <<<test_start>>>
>> > tag=3Dreadahead01 stime=3D1694636274
>> > cmdline=3D"readahead01"
>> > contacts=3D""
>> > analysis=3Dexit
>> > <<<test_output>>>
>> > tst_test.c:1558: TINFO: Timeout per run is 0h 02m 30s
>> > readahead01.c:36: TINFO: test_bad_fd -1
>> > readahead01.c:37: TPASS: readahead(-1, 0, getpagesize()) : EBADF (9)
>> > readahead01.c:39: TINFO: test_bad_fd O_WRONLY
>> > readahead01.c:45: TPASS: readahead(fd, 0, getpagesize()) : EBADF (9)
>> > readahead01.c:54: TINFO: test_invalid_fd pipe
>> > readahead01.c:56: TPASS: readahead(fd[0], 0, getpagesize()) : EINVAL (=
22)
>> > readahead01.c:60: TINFO: test_invalid_fd socket
>> > readahead01.c:62: TFAIL: readahead(fd[0], 0, getpagesize()) succeeded
>> >
>>
>> Reuben,
>>
>> This report is on an old version of your patch.
>> However:
>> 1. LTP test readahead01 will need to be fixed to accept also ESPIPE
>> 2. I am surprised that with the old patch readahead on socket did not
>>     fail. Does socket have aops?
>>
>> Please try to run LTP test readahead01 on the patch that Christian queue=
d
>> and see how it behaves and if anything needs to be fixed wrt sockets.
>>
>> Thanks,
>> Amir.
>
>
> ack.  Will try to test.  My Ubuntu 22.04 system wasn't able to find packa=
ges called
> for by the test case, so it'll take me a little while to figure out how t=
o get the
> test case working...

Heh! you can write a small C program instead, you don't even need to
build the LTP test.

It is clear what the failed test is doing:

static void test_invalid_fd(void)
{
        int fd[2];

        tst_res(TINFO, "%s pipe", __func__);
        SAFE_PIPE(fd);
        TST_EXP_FAIL(readahead(fd[0], 0, getpagesize()), EINVAL);
        SAFE_CLOSE(fd[0]);
        SAFE_CLOSE(fd[1]);

        tst_res(TINFO, "%s socket", __func__);
        fd[0] =3D SAFE_SOCKET(AF_INET, SOCK_STREAM, 0);
        TST_EXP_FAIL(readahead(fd[0], 0, getpagesize()), EINVAL);
        SAFE_CLOSE(fd[0]);
}

The report claims that readahead on socket succeeds
and this is surprising.

Thanks,
Amir.
