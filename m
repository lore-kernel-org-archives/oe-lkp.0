Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB979FF
	for <oe-lkp@lists.linux.dev>; Wed,  2 Aug 2023 17:01:14 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34914064ea9so25ab.1
        for <oe-lkp@lists.linux.dev>; Wed, 02 Aug 2023 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1690995674; x=1691600474;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFGXYWabYJ39ryOSt07GiPvsIReEz56NrabUnE8L4Ak=;
        b=qKuBqdJiHqr6O/uCq34uUGplnagg32QEnnT7tVTR++zzLIRY18ttqWdvU6rjhbD1if
         /UHsoE1Sq/PidUUn203n2FdVs2aM0SW97UBkXki6U4UFo6LltbmCJVd9Ni2nA8Ga3THx
         P40HQ0lnwyQHQWyce+aUy73pBhGsqbTYdhkklyeA7DNeNMlwmqTvHB8a9jF7Dj6xbLq/
         nGeozVq2jI1zbQ5+hltIYgaPcl+lRyoLdTkjvp4MKGVZSn2leAlJeGOSX+nZohVqoOzb
         huoCwYZA9ssmtoibtJF3L6ZMW5x42pU7Hy/4joQg3a4HV9Hcy3C0cedYw1iI1PItLpYE
         RQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995674; x=1691600474;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFGXYWabYJ39ryOSt07GiPvsIReEz56NrabUnE8L4Ak=;
        b=MDKEMMba9Fl6jm3LSCa5pBqjMV4OY25n7snNf0XLo+MG22GdHIygEgSdBqQ6uclZCH
         +nhPSSe1B9PUIluC3A+wH7xwA34m+U4BknSam8+E+d52FYamP84C9KaUroaxOu5ggkG+
         HOTZbgCvXqw63vK9YKjrlRpXDrA+G7WMx9TehMicPispUPdWe6h6vi4QvxJ0/HPR8xXW
         Az1IiuAKgjhAqIt9OB3udv/ITYc7KOq+YegYEA17HqMtXxvV0SU2KXF9WWCNrX7DjMET
         X0VEnJP9OWb9Ps9sSNrMlTNQHcl9m8XRCkjAkpFcoMF6uoS1o/p7ExX6Ju6r+yiMnJuv
         YHIw==
X-Gm-Message-State: ABy/qLZ9QNSNghx2iEProP6NRdpTs6DPIgB0R0m1gSqxh5lCpO++9351
	+Mvg2EYuglflqfIMtO5cCUCmMQ==
X-Google-Smtp-Source: APBJJlGoBM+fZubbdkemaN8DGpH/3h22QjA5dqB1SpPWUIX9A/yAxK2isUCXEkOjt6abU7fGYa9eug==
X-Received: by 2002:a92:d38d:0:b0:348:ec3f:fce1 with SMTP id o13-20020a92d38d000000b00348ec3ffce1mr12250281ilo.0.1690995674030;
        Wed, 02 Aug 2023 10:01:14 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id y8-20020a02a388000000b0042b46224650sm4345106jak.91.2023.08.02.10.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 10:01:13 -0700 (PDT)
Message-ID: <a2a6e445-1cbd-1c28-af60-3e449f9673ea@kernel.dk>
Date: Wed, 2 Aug 2023 11:01:12 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [axboe-block:xfs-async-dio] [fs] f9f8b03900:
 stress-ng.msg.ops_per_sec 29.3% improvement
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-fsdevel@vger.kernel.org,
 ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
References: <202308022138.a9932885-oliver.sang@intel.com>
 <029f3c86-c206-0ad5-9c42-04ea0b683367@kernel.dk>
In-Reply-To: <029f3c86-c206-0ad5-9c42-04ea0b683367@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/2/23 10:38?AM, Jens Axboe wrote:
> On 8/2/23 7:52?AM, kernel test robot wrote:
>>
>> hi, Jens Axboe,
>>
>> though all results in below formal report are improvement, Fengwei (CCed)
>> checked on another Intel(R) Xeon(R) Gold 6336Y CPU @ 2.40GHz (Ice Lake)
>> (sorry, since this machine doesn't belong to our team, we cannot intergrate
>> the results in our report, only can heads-up you here), and found ~30%
>> stress-ng.msg.ops_per_sec regression.
>>
>> but by disable the TRACEPOINT, the regression will disappear.
>>
>> Fengwei also tried to remove following section from the patch:
>> @@ -351,7 +361,8 @@ enum rw_hint {
>>  	{ IOCB_WRITE,		"WRITE" }, \
>>  	{ IOCB_WAITQ,		"WAITQ" }, \
>>  	{ IOCB_NOIO,		"NOIO" }, \
>> -	{ IOCB_ALLOC_CACHE,	"ALLOC_CACHE" }
>> +	{ IOCB_ALLOC_CACHE,	"ALLOC_CACHE" }, \
>> +	{ IOCB_DIO_DEFER,	"DIO_DEFER" }
>>
>> the regression is also gone.
>>
>> Fengwei also mentioned to us that his understanding is this code update changed
>> the data section layout of the kernel. Otherwise, it's hard to explain the
>> regression/improvement this commit could bring.
>>
>> these information and below formal report FYI.
> 
> Very funky. I ran this on my 256 thread box, and removing the
> IOCB_DIO_DEFER (which is now IOCB_CALLER_COMP) trace point definition, I
> get:
> 
> stress-ng: metrc: [4148] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
> stress-ng: metrc: [4148]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
> stress-ng: metrc: [4148] msg           1626997107     60.61    171.63   4003.65  26845470.19      389673.05
> 
> and with it being the way it is in the branch:
> 
> stress-ng: metrc: [3678] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
> stress-ng: metrc: [3678]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
> stress-ng: metrc: [3678] msg           1287795248     61.25    140.26   3755.50  21025449.92      330563.24
> 
> which is about a -21% bogo ops drop. Then I got a bit suspicious since
> the previous strings fit in 64 bytes, and now they don't, and I simply
> shortened the names so they still fit, as per below patch. With that,
> the regression there is reclaimed.
> 
> That's as far as I've gotten yet, but I'm guessing we end up placing it
> differently, maybe now overlapping with data that is dirtied? I didn't
> profile it very much, just for an overview, and there's really nothing
> to observe there. The task and system is clearly more idle when the
> regression hits.

Better variant here. I did confirm via System.map that layout
drastically changes when we use more than 64 bytes of string data. I'm
suspecting your test is sensitive to this and it may not mean more than
the fact that this test is a bit fragile like that, but let me know how
it works for you with the below.


diff --git a/include/linux/fs.h b/include/linux/fs.h
index 1e6dbe309d52..487ef4ae7267 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -353,20 +353,24 @@ enum rw_hint {
  */
 #define IOCB_DIO_CALLER_COMP	(1 << 22)
 
-/* for use in trace events */
+/*
+ * For use in trace events - keep the text sizes descriptions small, as it
+ * seems layout drastically changes if we have more than 64 bytes of total
+ * text in here.
+ */
 #define TRACE_IOCB_STRINGS \
-	{ IOCB_HIPRI,		"HIPRI" }, \
+	{ IOCB_HIPRI,		"PRI" }, \
 	{ IOCB_DSYNC,		"DSYNC" }, \
 	{ IOCB_SYNC,		"SYNC" }, \
-	{ IOCB_NOWAIT,		"NOWAIT" }, \
-	{ IOCB_APPEND,		"APPEND" }, \
-	{ IOCB_EVENTFD,		"EVENTFD"}, \
+	{ IOCB_NOWAIT,		"NWAIT" }, \
+	{ IOCB_APPEND,		"APND" }, \
+	{ IOCB_EVENTFD,		"EVFD"}, \
 	{ IOCB_DIRECT,		"DIRECT" }, \
 	{ IOCB_WRITE,		"WRITE" }, \
 	{ IOCB_WAITQ,		"WAITQ" }, \
 	{ IOCB_NOIO,		"NOIO" }, \
-	{ IOCB_ALLOC_CACHE,	"ALLOC_CACHE" }, \
-	{ IOCB_DIO_CALLER_COMP,	"CALLER_COMP" }
+	{ IOCB_ALLOC_CACHE,	"ACACHE" }, \
+	{ IOCB_DIO_CALLER_COMP,	"CCOMP" }
 
 struct kiocb {
 	struct file		*ki_filp;
 

-- 
Jens Axboe

