Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D025D1E9
	for <oe-lkp@lists.linux.dev>; Tue, 30 Dec 2025 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767132299; cv=none; b=i9PxxmhKPEu3XsnSf5sZIoV97/6UeCza49CmHj1Ajq99PT2s/8I4KDcF2klzZVFXEuLyf1i5V5mEuAMLZbLeJDicUnKeciZgw0QtAoI54d/gYB7LV2Chrjg4MXtLgr3Gjjq4u9HbTe1wmmm1LFNr6YWm8VgWLmSC9X70nmHCC2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767132299; c=relaxed/simple;
	bh=ciEnuCD23jowJ/L+XGQbb7pSaDpfH4eCH7oImwf2d0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G77/AUDjubXaBEwoJ8jKQqHrEth9gZGLsMLgkICh9fVWsfVh2hBel9M7vhFltIEKsrE4Q609BYTaumIjQiDKW5vQcW2T1SOkIZTFFYCqbFOxa1Rpe6IVKcx7O6k6cLT/6+H2wSLYtOMJDOInzoPs0dMpaF+LNWuuAPvAFVy45ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6m/1OyU; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6m/1OyU"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so13325738a12.1
        for <oe-lkp@lists.linux.dev>; Tue, 30 Dec 2025 14:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767132296; x=1767737096; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iL9oUwPK6pMmNAMWI41vZfP4nRtVQLFCd6SfZyUQxgg=;
        b=O6m/1OyU44qMcJ/J2XsYXHqXzKO1gpKsZsPsDAYO9pm+Xz1YVt+907y2rZbmorhI1Y
         R7QxJkg5L7WW9Zy5sBaPA0UoOULnUCZOte+rePiHU3Gsdc3pYsYfC/XJl98Gogc0gNGE
         dr7kZqNnUroVSA+hNnIUi31h+plDJD9LBq7QFyfArayFKBczBO5QWGUrqzL2CY2z03/M
         5CMVE7/FyXMQR0QyGf3ilq5QgjciT86Rjd/Bk/dp4x0HPlX/K1vVzWO1U+MXeqTfIiBP
         km9Mx3gsRKkdAxxEbfnwsrLDRYd2m1KgtguIPwRCx/7iOtG3O3AHkuqHhXHYeH+FQfPb
         tP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767132296; x=1767737096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iL9oUwPK6pMmNAMWI41vZfP4nRtVQLFCd6SfZyUQxgg=;
        b=kR7MOluG+CszskJKqYNeiTnBD4XXDsv+dAYsVgdghdiJH5aCca4VmSUpBDaHbP6tH8
         ZDe4mMa91BX1HCtc4TLV6ffnOpSmX8SK2vRaW99UsADxDTOpsrJwacfX2Ubo3Ck28hob
         UUPHGltP5x+413CMjfQxNIUfuqECoYKros8BsrFLZkq+HHGXoyiMoBY8wZjmT9IAVuVM
         bTOCgMWnc8+sm1Odm2I/IWqI1uaGW5yaupGfn6Hif8rovNszuNAlfPtHr7Bo6Gnu+smT
         s49MX1BZ2uIQUVxDfil5vehb4ZNyg6HA0WhAw/Lu53y3FB9NkckjfPPNg/EJ3G5jaThO
         Yh7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeBsLu93Pvb1+g+l9h/bLu6pRFc4+TmFYx/iRPFiErOv2JRUzngZ1mf4DviGidDzqHTqiEOHg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze4SFBw2Eb41X5Ue0nUMHt0zH53LumLGIcITjhtLHQUwIuCVgK
	fmABxkjMVhmtimT0Z1jc8O/TKFv4A892N+s59p1oLfeZpKSfd0YBPiqTLNoIkLlo
X-Gm-Gg: AY/fxX4MQyn9NX02AoNmbl2l2a7rxTQGoYkGvkrGzlzMsvQv8xvMMn1VVNI1jd54LwO
	MNnE9TBJJaZjMHAzzEY2zKA9uK+TsHwjYFQfaTZMzqldo+Yao+nTJmRJGDvEARs7roYIL9qPCn+
	zvJrMh/A4dGPZqtLr9oXNM/IOqiH/YCu9TKZBg4/tzYUINKESpcW3jOt2AZZ/tPLLxIgP66mriT
	DH+jh2qb7qkAilRZJX/hTxocudhOU2QhKyNDeBQ0Z+h4QgW3WX2H/5Ph3uj9jBga19YoWjGzSHr
	AvgJAXy51pADlXsG045Zj531rLKCYfk4lxPJAWX5J86QVx8u+AaPfk5pU7NihIYbP50ggMX/UZ0
	liyiQneatxHkoza7FHWHFIs4px76T6jDGP4lNXdDXY4F4h/7euJOPgAvWIal9ofLPn4EfLgfHma
	IfgxUWg6l4XyPSDG+TBaQb8zlYlCbCEk9r/bNWM6TO3WQZDTzHbJv+zCFYE2w=
X-Google-Smtp-Source: AGHT+IFNqw3fHXA+0vU+KlB/nzXR38Cm2kP1GIXjrZY1/19S+eNMcf/p5//Z+VJzLtIGZInAPA2ybA==
X-Received: by 2002:a05:6402:2685:b0:64b:6e44:217 with SMTP id 4fb4d7f45d1cf-64b8e2a6a78mr34031433a12.0.1767132296212;
        Tue, 30 Dec 2025 14:04:56 -0800 (PST)
Received: from f (cst-prg-87-163.cust.vodafone.cz. [46.135.87.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f5400bsm35893748a12.4.2025.12.30.14.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 14:04:55 -0800 (PST)
Date: Tue, 30 Dec 2025 23:04:46 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	David Howells <dhowells@redhat.com>, lkp@intel.com, oe-lkp@lists.linux.dev, 
	Alexander Viro <aviro@redhat.com>
Subject: Re: [PATCH RFC] fs: cache-align lock_class_keys in struct
 file_system_type
Message-ID: <o6cnjqy4ivjqaj4n5xphstfnk5jznufaygwmfkm2gyixqgfump@7fc6c6h6d5if>
References: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>

On Tue, Dec 30, 2025 at 03:07:10PM -0600, Eric Sandeen wrote:
> LKP reported that one of their tests was failing to even boot with my
> "old mount API code" removal patch. The test was booting an i386 kernel
> under QEMU, with lockdep enabled. Rather than a functional failure, it
> seemed to have been slowed to a crawl and eventually timed out.
> 
> I narrowed the problem down to the removal of the ->mount op from
> file_system_type, which changed structure alignment and seems to have
> caused cacheline issues with this structure. Annotating the alignment
> fixes the problem for me.
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel.com
> Fixes: 51a146e05 ("fs: Remove internal old mount API code")
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> ---
> 
> RFC because I honestly don't understand why this should be so critical,
> especially the structure was not explicitly (or even very well) aligned
> before. I would welcome insights from folks who are smarter than me!
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 9949d253e5aa..b3d8cad15de1 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2279,7 +2279,7 @@ struct file_system_type {
>  	struct file_system_type * next;
>  	struct hlist_head fs_supers;
>  
> -	struct lock_class_key s_lock_key;
> +	struct lock_class_key s_lock_key ____cacheline_aligned;
>  	struct lock_class_key s_umount_key;
>  	struct lock_class_key s_vfs_rename_key;
>  	struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
> 

There is no way is about cacheline bouncing. According to the linked
thread the test vm has only 2 vcpus:
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

Even if the vcpu count was in hundreds and the ping pong was a problem it
still would not have prevented bootup.

Instead something depends on the old layout for correctness.

By any chance is this type-punned somewhere?

While I can't be bothered to investigate, I *suspect* the way to catch
this would patch out all of the lock_class_key vars & uses and boot with
KMSAN (or was it KASAN?). Or whatever mechanism which can tell the
access is oob.
