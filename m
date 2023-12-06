Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05F49F66
	for <oe-lkp@lists.linux.dev>; Wed,  6 Dec 2023 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neJzEY2W"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d99bc65219so2512094a34.3
        for <oe-lkp@lists.linux.dev>; Wed, 06 Dec 2023 09:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701883470; x=1702488270; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IZDShyZXW7vdD+sEytI5yOQzMqBtyU656pypgNuq0Og=;
        b=neJzEY2W1RKRDeVx2WrvbMjpKh0WQYK6s7WBAq4NMx0eo5O7gYWMthrRHWRxE+CHZy
         8OJ/i8X6DanMVCAfTbSB2sO++72Qsyo9hqP3SFFJ9TxAlmxiv82zvXMjsaAE6wN/s2W0
         xqJx+gCR95PlTTWzkmvff79UE2BYs19L5DG4wFvjfkA/+ewlvOsGM3Le1ig799a48hVD
         /45jJ+dlIK1N5nA4Ug+KY8Wfe+uzfrUTLcurAPVcBGVTEQgKb0Q+Ox/s94cIOXQOUXB7
         MOIsAUOGWBOwJWJoPcmvuTc2pFkv9dVqQK0Y0l1ruNf6nQWqD06Vv3vCfMkCji4jn0+b
         8Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701883470; x=1702488270;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZDShyZXW7vdD+sEytI5yOQzMqBtyU656pypgNuq0Og=;
        b=eSCFGUMdYKvAGLmB1eaZKpl9hlvILFOPBG/p+7hsNyGjWjimz9gX2Zxx/6v2t9wv1B
         ea+YKX5E9MFatPLgN1HKAswKFd9KsbTDRn7XHosoyfjghaVzZTHnFBLfI7RDNiWMYAL/
         0s1JpEaR0urPJ0OHMDYu+Z7NomVcwIrQf/zEpQBLtX42qXF9WEPjjV3Lkx2tAYIS4kgY
         uzYsMSWkdRPhRXqlaZhDawwLpnxcLVlsOyVu0/NTwzQ/Cjydge76nnNtNFb5zqamWjCV
         iH1slIZPD7LI+W2BeoV2VjSkmZeWVPlARcEG66W6Y4umNoYraZ5FQk0q7AXykNBXYZcN
         aP+A==
X-Gm-Message-State: AOJu0YwHjXV7W2G5dakwAw1W0JxjRJ24lbrizf1r9xwBsL1ewNVHKt5x
	v37wTLrOsq15BHTflHNhdW+3Xx+iYhg8Gjbdy9c=
X-Google-Smtp-Source: AGHT+IFJJ8SeqZ/WE3l4lLx73t12F9/QDukHuCGUyVDCvOIHofKuZ4kM+7RXMuKJp85Aym8z0GgdSpaS4VPCzYoaGrk=
X-Received: by 2002:a05:6871:7a3:b0:1fa:511:ff40 with SMTP id
 o35-20020a05687107a300b001fa0511ff40mr1281729oap.21.1701883469905; Wed, 06
 Dec 2023 09:24:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6802:30f:b0:50c:13ee:b03d with HTTP; Wed, 6 Dec 2023
 09:24:29 -0800 (PST)
In-Reply-To: <20231206170958.GP1674809@ZenIV>
References: <20231201065602.GP38156@ZenIV> <20231201200446.GA1431056@ZenIV>
 <ZW3WKV9ut7aFteKS@xsang-OptiPlex-9020> <20231204195321.GA1674809@ZenIV>
 <ZW/fDxjXbU9CU0uz@xsang-OptiPlex-9020> <20231206054946.GM1674809@ZenIV>
 <ZXCLgJLy2b5LvfvS@xsang-OptiPlex-9020> <20231206161509.GN1674809@ZenIV>
 <20231206163010.445vjwmfwwvv65su@f> <CAGudoHF-eXYYYStBWEGzgP8RGXG2+ER4ogdtndkgLWSaboQQwA@mail.gmail.com>
 <20231206170958.GP1674809@ZenIV>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 6 Dec 2023 18:24:29 +0100
Message-ID: <CAGudoHErh41OB6JDWHd2Mxzh5rFOGrV6PKC7Xh8JvTn0ws3L_A@mail.gmail.com>
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()] 1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	linux-doc@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On 12/6/23, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Wed, Dec 06, 2023 at 05:42:34PM +0100, Mateusz Guzik wrote:
>
>> That is to say your patchset is probably an improvement, but this
>> benchmark uses kernfs which is a total crapper, with code like this in
>> kernfs_iop_permission:
>>
>>         root = kernfs_root(kn);
>>
>>         down_read(&root->kernfs_iattr_rwsem);
>>         kernfs_refresh_inode(kn, inode);
>>         ret = generic_permission(&nop_mnt_idmap, inode, mask);
>>         up_read(&root->kernfs_iattr_rwsem);
>>
>>
>> Maybe there is an easy way to dodge this, off hand I don't see one.
>
> At a guess - seqcount on kernfs nodes, bumped on metadata changes
> and a seqretry loop, not that this was the only problem with kernfs
> scalability.
>

I assumed you can't have possibly changing inode fields around
generic_permission.

> That might account for sysinfo side, but not the unixbench - no kernfs
> locks mentioned there.  OTOH, we might be hitting the wall on
> ->i_rwsem with what it's doing...
>

I did not see anything about unixbench, the subject only talks about stressng.

That said now I'm curious enough what's going on here to give it a
serious poke instead of a quick glance.

-- 
Mateusz Guzik <mjguzik gmail.com>
