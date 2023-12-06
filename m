Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727611D682
	for <oe-lkp@lists.linux.dev>; Wed,  6 Dec 2023 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ6dnUwY"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9d307a732so203608a34.1
        for <oe-lkp@lists.linux.dev>; Wed, 06 Dec 2023 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701881563; x=1702486363; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i1au5lbtdhuYhTzxu7K3e1mZkKqka6jLLtZkjNaoKMc=;
        b=ZQ6dnUwYee6y1OteB8bhIJjRsD16KjP14npvqDZASV2g7lN2h1vbOUz7A6QHOpx1XV
         q6zJBTeJmdjTQxSky3iHgv+XBHXdKDhkyXBt+kb6J9hRp2rvLtcyF/ZLm9PJ2kl1P6YT
         TfUlGOVbAnpI9VWCw1DumStFW+8E/YPSnvl0siMXGzbq7+4Q2nWJ32oXV7WSnZdko+zW
         HHQlowSB2FBRL1Qrf3Pa5NgD8/QtwGqHYzqorGgzeTIspmA8ZePMFuJmXeqhnwqsU5hC
         mwLQ99GcobspSCOZm5PmnbnP6Sa9/PsuZWMMSRW9jBT4zJFhzoaECazndRg3TIBXoLyo
         +v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701881563; x=1702486363;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1au5lbtdhuYhTzxu7K3e1mZkKqka6jLLtZkjNaoKMc=;
        b=JM52Q0XfwDiDgiTSJtFSiYOCsCZr3eu1WxDa6Qu9duA2fyKCbqXkP/YopGcevncH7w
         nvGgornW0oNKEZPlc/EKQ26kFjBVgGhQj2PDWMUth9enSFzU7m/xL5K1cfQ6tCrPhCrB
         vFKoT5OVu0GY5YTQz7F7HOANPvFa/pkzRsPnoJCtl6lz03AMgqSW5PzhMJhWttLshWCo
         rzEyC9NrSxUmRh59f/M7mQdcEn6eI1829nu+RchpYzFl9LYTCpqSN4VDTLWNDbzzf/eT
         t7iDMA4Dz2W9KcwqMc2nWUIlKLnclu55oehjBtzEsXOA03NkMVWLc7vOBpQUS9evG92p
         mlog==
X-Gm-Message-State: AOJu0Yxw+LAKtrGSPwIpe/7XHyEgfhZHEPVh1ALDww0460xEnreQi0TQ
	u+91EK8Vre5qD1IM2q0w//Ao+wp55u4IMQzPrL0=
X-Google-Smtp-Source: AGHT+IGZ/Yr5F7fr0x3yUHZ3H8FzlhrdgaoQi9g9SY9SBjIS2V506x0YzxsM95+SBtT/PUWyn/Ecfay+HG2v633hkYE=
X-Received: by 2002:a05:6870:1711:b0:1fb:75c:3feb with SMTP id
 h17-20020a056870171100b001fb075c3febmr1324530oae.75.1701881563431; Wed, 06
 Dec 2023 08:52:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6802:30f:b0:50c:13ee:b03d with HTTP; Wed, 6 Dec 2023
 08:52:43 -0800 (PST)
In-Reply-To: <20231206164513.GO1674809@ZenIV>
References: <20231201040951.GO38156@ZenIV> <20231201065602.GP38156@ZenIV>
 <20231201200446.GA1431056@ZenIV> <ZW3WKV9ut7aFteKS@xsang-OptiPlex-9020>
 <20231204195321.GA1674809@ZenIV> <ZW/fDxjXbU9CU0uz@xsang-OptiPlex-9020>
 <20231206054946.GM1674809@ZenIV> <ZXCLgJLy2b5LvfvS@xsang-OptiPlex-9020>
 <20231206161509.GN1674809@ZenIV> <20231206163010.445vjwmfwwvv65su@f> <20231206164513.GO1674809@ZenIV>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 6 Dec 2023 17:52:43 +0100
Message-ID: <CAGudoHGUDtiRN_AbMHYWPN+ABRkMUG-sZD5J=v0x2Z=HrK+hnw@mail.gmail.com>
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()] 1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	linux-doc@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On 12/6/23, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Wed, Dec 06, 2023 at 05:30:10PM +0100, Mateusz Guzik wrote:
>
>> > What the hell is going on?  Was ->d_lock on parent serving as a throttle
>> > and reducing
>> > the access rate to something badly contended down the road?  I don't see
>> > anything
>> > of that sort in the profile changes, though...
>
>> Not an outlandish claim would be that after you stopped taking one of
>> them, spinning went down and more traffic was put on locks which *can*
>> put their consumers off cpu (and which *do* do it in this test).
>
> That's about the only guess I've got (see above), but if that's the case,
> which lock would
> that be?
>
>> All that said I think it would help if these reports started including
>> off cpu time (along with bt) at least for spawned threads.
>

Given backtracs I posted it's at least root->kernfs_iattr_rwsem (see
kernfs_iop_permission), but there may be more.

Ultimately I expect would be easy to answer if one was to rebuild with lockstat.

I may end up doing it tomorrow if there is a problem testing this on your end.

-- 
Mateusz Guzik <mjguzik gmail.com>
