Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E092CA2
	for <oe-lkp@lists.linux.dev>; Mon, 24 Apr 2023 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682350620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CAo7ajv8NQ/2ztFNCQQbDdpRXuWVRxNmzbnC6f9fp4=;
	b=ecVZsdyDcQvYp/7hw9H5YpG/OGpt1phLusW0b7i4hhFxrwkWXrW6OgzGn6zRZJzcof0iE0
	jWFQfN14PWi9kAANji3LeGT/ICwD9w0mYFHZWU+N358TnEqyJgaCKp6g20qht2lqItktBg
	PNuDSSBUYPey+P8mzEA9y+2EwzuHPJY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-F-HNqkD2NJKo4LNiARWR5w-1; Mon, 24 Apr 2023 11:36:59 -0400
X-MC-Unique: F-HNqkD2NJKo4LNiARWR5w-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-5ef41e29cb9so28874296d6.0
        for <oe-lkp@lists.linux.dev>; Mon, 24 Apr 2023 08:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682350618; x=1684942618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CAo7ajv8NQ/2ztFNCQQbDdpRXuWVRxNmzbnC6f9fp4=;
        b=Dp2Ri0l+OBRtjKKNpxrgGyBWauNXwiBZC7shQy+xCYx+5Um0ACvCGXOT7RWJVQPPSR
         rasyNBipGgT3QUVgrpdSwoBpeGkSfJqMLYesCBM/COABjsbFur8GnMvd1/i+lneDvABO
         7Y+SdrcopXnEiKxEi2G98ESXXcY+9XhWFYue1yyF13HTF/4PMLzoqJNF6lyAb0ehjepA
         MYDRFHkY4WK6D3BitfS/O8c6yUkFi4nECqxFEIsXQSrjU0gQvqvCBd0Oi6s1V5GZ87Un
         V1rkiUqZzKJA3f22L7AmgAzyR7j7S8Gbt48UK9AkL7pdXVtYJyHK+ZqT8DfMtG/3pXBa
         4jOQ==
X-Gm-Message-State: AAQBX9d49UV3lD9CMoLNSUs8G+K8LwTFPhZRsNOyx9e1o6//5YbrkDxO
	bMakxS3E2BCJJ9R7ZsPdPNoADk5XjU0eegl+Dr/U450p/0PJxUGSsTubv1VuIovUbPJBRdzyt7Q
	dYp8TZkkiJ56YVVX27RB43maD
X-Received: by 2002:a05:622a:1a09:b0:3ef:3af7:1c4a with SMTP id f9-20020a05622a1a0900b003ef3af71c4amr23814705qtb.5.1682350618333;
        Mon, 24 Apr 2023 08:36:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1sU41bm37KXgY1/iSYPLEpQ6S3VAy+8sj8XhWZFOdj93XffQuOAs3sNYAX2qXESHEnyg80g==
X-Received: by 2002:a05:622a:1a09:b0:3ef:3af7:1c4a with SMTP id f9-20020a05622a1a0900b003ef3af71c4amr23814661qtb.5.1682350618008;
        Mon, 24 Apr 2023 08:36:58 -0700 (PDT)
Received: from [192.168.149.117] (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
        by smtp.gmail.com with ESMTPSA id x15-20020ac84d4f000000b003ef28a76a11sm3697374qtv.68.2023.04.24.08.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 08:36:57 -0700 (PDT)
Message-ID: <f7e2495d-56d1-158e-b898-d3869e4e4a89@redhat.com>
Date: Mon, 24 Apr 2023 17:36:53 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [kvm:queue] [kvm] c7ed946b95: kvm-unit-tests.msr.fail
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, kvm@vger.kernel.org,
 Robert Hu <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>,
 Danmei Wei <danmei.wei@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jim Mattson <jmattson@google.com>
References: <202304241320.ab1eea12-yujie.liu@intel.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <202304241320.ab1eea12-yujie.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: de-CH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Am 24/04/2023 um 08:19 schrieb kernel test robot:
> Hello,
> 
> kernel test robot noticed "kvm-unit-tests.msr.fail" on:
> 
> commit: c7ed946b95cbd4c0e37479df320daf6af7e86906 ("kvm: vmx: Add IA32_FLUSH_CMD guest support")
> https://git.kernel.org/cgit/virt/kvm/kvm.git queue
> 
> in testcase: kvm-unit-tests
> version: kvm-unit-tests-x86_64-02d8bef-1_20230421
> 
> compiler: gcc-11
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770K CPU @ 3.50GHz (Haswell) with 8G memory
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202304241320.ab1eea12-yujie.liu@intel.com
> 
> 
> $ ./run_tests.sh -v msr
> TESTNAME=msr TIMEOUT=90s ACCEL= ./x86/run x86/msr.flat -smp 1 -cpu max,vendor=GenuineIntel
> FAIL msr (1899 tests, 2 unexpected failures)
> 
> # msr.log
> timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel x86/msr.flat -smp 1 -cpu max,vendor=GenuineIntel # -initrd /tmp/tmp.BZGuoMxiVP
> enabling apic
> smp: waiting for 0 APs
> ...
> FAIL: Expected success on WRSMR(PRED_CMD, 0x0), got vector 13
> FAIL: Expected success on WRSMR(PRED_CMD, 0x1), got vector 13
> ...
> 
> 

FYI this failure is fixed with
https://patchwork.kernel.org/project/kvm/cover/20230322011440.2195485-1-seanjc@google.com/
which is currently on the 'kvm/next' branch. I tested it just to be sure.
The 'kvm/queue' branch doesn't contain that patch yet, and that's why
this unit test failed.

Thank you,
Emanuele

