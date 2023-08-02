Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16CE8476
	for <oe-lkp@lists.linux.dev>; Wed,  2 Aug 2023 16:38:45 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-790dcf48546so152839f.0
        for <oe-lkp@lists.linux.dev>; Wed, 02 Aug 2023 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1690994324; x=1691599124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=knx7YjiwBy7HGAC7r4NBtlZh2leQBFG4jTpwPWwNeHo=;
        b=uyR7BoILPtnW7A3ET2mq8uVRRvjhs2wn4Yp2gcBDwxJTcoTdWNUhBATUfc8jLXxy38
         QHZjXFQhBYPFENKUGnBHQKtA36+00AP6b3EH+O3lr8uebTUY3tGTP3y1OUWWxmwLMR+9
         RgOus+wejfpMg7jUFMGVIHRJx2WBsYKPo0YubT1SeAhiEWMKyCpFtH8Vtbhq3RWCvDrK
         RA7nP2iQsj15eOwTQmfB3cCwgamta0VypsbB/vaSUEmFWO+j9tb6JvwfN0L0tb665EIo
         oGxLMgbNx+E/1lIAqWIi8FhcmDT8aulht7RprIGVc+DR6soWPyazyxhb/yOJSxMPgp4z
         nYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690994324; x=1691599124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knx7YjiwBy7HGAC7r4NBtlZh2leQBFG4jTpwPWwNeHo=;
        b=cU1lH7Pi7FKAj6zkzu7FEhGI99s/Jr4116C2o+oY2qD5E4DLXwa+XqbzSAPbk8Jbom
         txpjeFVdSh5RcU14qPqwe0q942wSvXv+r+2ZwtsyYSorq6kt/ov2oz2ZXC+fnZoupVC6
         5pcoAB/5WTjHNiPf5I15BBAP1HtZJyxjd0k4RhozepwZpbojF53FHfThGiRbAnIjKXSP
         FahdmNjGW1k2heJaa77fpRx3V9FA7jyTLIALR3ZUHat7apgvBEorWQpCsKkMPkpvKulo
         IW2BTE0wcGkynZEab9G9F+57ic5jpiA28WA0vTcoF5+f2ynzGd/ZTpvZlH3cr7kl9pG2
         uG4w==
X-Gm-Message-State: ABy/qLbonB5SaeF7D/0zGkiwG44MdbT3POfxlltvNY/qpn6zh/Ai/oiG
	EAZb/WxcV4qeTg0OB8g2Gg76DA==
X-Google-Smtp-Source: APBJJlF2fe+p3V8IbaSnMSysVY7amhQFZQ7ttHLWyaUZiEszhjBPRlSZoGaOT/8bo39deGyTCNq1GQ==
X-Received: by 2002:a6b:c30f:0:b0:783:6e76:6bc7 with SMTP id t15-20020a6bc30f000000b007836e766bc7mr13679465iof.2.1690994324330;
        Wed, 02 Aug 2023 09:38:44 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id l24-20020a02a898000000b0042b2e90ed06sm4630722jam.23.2023.08.02.09.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 09:38:44 -0700 (PDT)
Message-ID: <029f3c86-c206-0ad5-9c42-04ea0b683367@kernel.dk>
Date: Wed, 2 Aug 2023 10:38:43 -0600
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
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-fsdevel@vger.kernel.org,
 ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
References: <202308022138.a9932885-oliver.sang@intel.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202308022138.a9932885-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/2/23 7:52?AM, kernel test robot wrote:
> 
> hi, Jens Axboe,
> 
> though all results in below formal report are improvement, Fengwei (CCed)
> checked on another Intel(R) Xeon(R) Gold 6336Y CPU @ 2.40GHz (Ice Lake)
> (sorry, since this machine doesn't belong to our team, we cannot intergrate
> the results in our report, only can heads-up you here), and found ~30%
> stress-ng.msg.ops_per_sec regression.
> 
> but by disable the TRACEPOINT, the regression will disappear.
> 
> Fengwei also tried to remove following section from the patch:
> @@ -351,7 +361,8 @@ enum rw_hint {
>  	{ IOCB_WRITE,		"WRITE" }, \
>  	{ IOCB_WAITQ,		"WAITQ" }, \
>  	{ IOCB_NOIO,		"NOIO" }, \
> -	{ IOCB_ALLOC_CACHE,	"ALLOC_CACHE" }
> +	{ IOCB_ALLOC_CACHE,	"ALLOC_CACHE" }, \
> +	{ IOCB_DIO_DEFER,	"DIO_DEFER" }
> 
> the regression is also gone.
> 
> Fengwei also mentioned to us that his understanding is this code update changed
> the data section layout of the kernel. Otherwise, it's hard to explain the
> regression/improvement this commit could bring.
> 
> these information and below formal report FYI.

Very funky. I ran this on my 256 thread box, and removing the
IOCB_DIO_DEFER (which is now IOCB_CALLER_COMP) trace point definition, I
get:

stress-ng: metrc: [4148] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
stress-ng: metrc: [4148]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: metrc: [4148] msg           1626997107     60.61    171.63   4003.65  26845470.19      389673.05

and with it being the way it is in the branch:

stress-ng: metrc: [3678] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
stress-ng: metrc: [3678]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: metrc: [3678] msg           1287795248     61.25    140.26   3755.50  21025449.92      330563.24

which is about a -21% bogo ops drop. Then I got a bit suspicious since
the previous strings fit in 64 bytes, and now they don't, and I simply
shortened the names so they still fit, as per below patch. With that,
the regression there is reclaimed.

That's as far as I've gotten yet, but I'm guessing we end up placing it
differently, maybe now overlapping with data that is dirtied? I didn't
profile it very much, just for an overview, and there's really nothing
to observe there. The task and system is clearly more idle when the
regression hits.
 

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 1e6dbe309d52..52bd9e6a29ea 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -355,18 +355,18 @@ enum rw_hint {
 
 /* for use in trace events */
 #define TRACE_IOCB_STRINGS \
-	{ IOCB_HIPRI,		"HIPRI" }, \
+	{ IOCB_HIPRI,		"HPRI" }, \
 	{ IOCB_DSYNC,		"DSYNC" }, \
 	{ IOCB_SYNC,		"SYNC" }, \
-	{ IOCB_NOWAIT,		"NOWAIT" }, \
+	{ IOCB_NOWAIT,		"NWAIT" }, \
 	{ IOCB_APPEND,		"APPEND" }, \
-	{ IOCB_EVENTFD,		"EVENTFD"}, \
+	{ IOCB_EVENTFD,		"EVD"}, \
 	{ IOCB_DIRECT,		"DIRECT" }, \
 	{ IOCB_WRITE,		"WRITE" }, \
 	{ IOCB_WAITQ,		"WAITQ" }, \
 	{ IOCB_NOIO,		"NOIO" }, \
-	{ IOCB_ALLOC_CACHE,	"ALLOC_CACHE" }, \
-	{ IOCB_DIO_CALLER_COMP,	"CALLER_COMP" }
+	{ IOCB_ALLOC_CACHE,	"ALLOC" }, \
+	{ IOCB_DIO_CALLER_COMP,	"CALLER" }
 
 struct kiocb {
 	struct file		*ki_filp;

-- 
Jens Axboe

