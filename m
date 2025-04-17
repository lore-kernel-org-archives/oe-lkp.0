Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B41D63D6
	for <oe-lkp@lists.linux.dev>; Thu, 17 Apr 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885086; cv=none; b=QrHUsEZNCcf8u8V5pMwS9xn3ZwV1HYzv8SBJAzAxRqjmv7gqFrTANqRvWf2o9SUHmOanUyYBqfSnygla2hQtni8NrwvD7iV4DoiWs7XSK+ZR5zJL61YbS6vpHhuDt2tw9yxGAiFWSXD+btRiOF9W0WEn8UcmydSq7UzoxtZ7+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885086; c=relaxed/simple;
	bh=rF92U0urWt6p/1AbiPtAf80xk17/Dsl9xvRoza9f7OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksopEjWu7ZExGMgyYslu2aW2EjPboocAV6CGS7CEtR/UmzIBU33yuWfKbTP0NyfFEXLcWHpfxitJtGyt4v6zOtgRge8MxN5iJExG5Ut4dPik2/IXP3t4G/Xbspgp2n4XrWuKwa9ABKGBP3qYHke0xSF1NjT5Fe7gZgBK5Gy9Suw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL3UKBK3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL3UKBK3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac29fd22163so87219966b.3
        for <oe-lkp@lists.linux.dev>; Thu, 17 Apr 2025 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744885083; x=1745489883; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9skOushEggbMsJxKcF45wWS3+ATrrzyuUsGqv0t7ro=;
        b=CL3UKBK3SS53/Ch0Es5vcu0tRFUqdMOk0PBOMui05u3TwJJh7vvA/W/u4UrKJib/Oc
         ij2sf8NTgNUAx76QCb0I59WhFxC8Zul9DeiuhD5otdjPpIcJ0Xu58XkeeX4nqjdTZMhQ
         s0StB2tIqf9Bzw9bI+6H/wdupVkILvurkLXX4KxNcrn7tG/etnHg5dXwWGwG+Wh9//8z
         Tzzl90VTMZb+D9EBlBBbV7+2cgYTGUqwpCCdt2KmauL6zwg9gbR0r0HN2jmVQ3QVEim8
         3SycKN9zy8qkaYsXu4zovjFBLH4/I1NvP1/FHvRgcCzx0xcRXNQCLvvxUJ+QKY6rtt/I
         ugtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885083; x=1745489883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9skOushEggbMsJxKcF45wWS3+ATrrzyuUsGqv0t7ro=;
        b=J5Pb7eakS/utllyFbLsBv1JX+fiu+Y0Lb8RRIoYsrUrTz8Q0HAMTKHDegIFvwCf0y1
         FSVGOrK67uTcArxNp6iX7wNeC/r815liH9D4vF7dffT3d2YmNiorVTL375vTNV1t1SZ2
         /XBS6NBJrjtMAhl3bnbHOI/MPVmm+uZDU8nFuiEklFZ23qKz6VZ3FlcH2pv8FLgYfYXL
         GYxGyyZn3QJU0QvfPM/s8nwigy+LTpVVIuEmpRKtdmG5m5AGmK4QisFtFiHPxgZwT96o
         eD6cHd4j9dV8oDM7Zi5SNLUXveYLDDi+bZAmkIW8GsxaigA3mTXP1quOZlqxw/TfVnya
         D5RQ==
X-Gm-Message-State: AOJu0Yxkg+AhViGhtq8mIYb7bT8sF7Yj3ROzGy7VuZGrlwtNWXQfTw0Q
	jRQPUxkFYDffUiQjOq43KG3gumyjML3hndN1p8OkB1Gaf19m7/h/zjeIjw==
X-Gm-Gg: ASbGncuK3LtroDtz0gFbGXdoYg8LoWxAoXmG5CBPo4o3hvM3Hd1++zlXWVnpboqDLNb
	9m/qKvHTztxN4AKKBwBRYzddVeNJxYc+twS/4Ue6pQivuGHI4O3XIMYl5jAtHwYYu8cS+L3Ti3Q
	gvwX49593DX4s0d/5RZ8pVBbe+KOiyJQDzCuk/sO7sNXKNJNeJ3tzSXFjQS2tAoCLjBKMcJ7Lwz
	ckobr3GvTDvJAGwrvEajrPhKp2yRAL9sSbPRFIHaAeU0iFZXx/uqANBXjl/chetyz9tqTYrUhk4
	s7sRiHBiJtY6/J/k3LRKqF2XyMbTh6m7hrpClr9NiL4MipqXLgk6dDDD
X-Google-Smtp-Source: AGHT+IFlFTz1i8hkW1ayUI43fP0HBbOeOnZrYXBdNwyKbNNyaLitmXK/BtM5DVGKI9LSAZcCdlpucw==
X-Received: by 2002:a17:907:7fa7:b0:ac7:95b3:fbe2 with SMTP id a640c23a62f3a-acb42c5a12fmr400036666b.56.1744885083009;
        Thu, 17 Apr 2025 03:18:03 -0700 (PDT)
Received: from f (cst-prg-69-142.cust.vodafone.cz. [46.135.69.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d32ecbesm269586266b.161.2025.04.17.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:18:02 -0700 (PDT)
Date: Thu, 17 Apr 2025 12:17:54 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [linus:master] [fs] a914bd93f3:
 stress-ng.close.close_calls_per_sec 52.2% regression
Message-ID: <hupjeobnfvo7y3jyvomjuqxtdl2df2myqxwr3bktmxabsrbid4@erg2ghyfkuj5>
References: <202504171513.6d6f8a16-lkp@intel.com>
 <CAGudoHGcQspttcaZ6nYfwBkXiJEC-XKuprxnmXRjjufz2vPRhw@mail.gmail.com>
 <CAGudoHHMvREPjWNvmAa_qQovK-9S1zvCAGh=K6U21oyr4pTtzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGudoHHMvREPjWNvmAa_qQovK-9S1zvCAGh=K6U21oyr4pTtzg@mail.gmail.com>

On Thu, Apr 17, 2025 at 12:02:55PM +0200, Mateusz Guzik wrote:
> bottom line though is there is a known tradeoff there and stress-ng
> manufactures a case where it is always the wrong one.
> 
> fd 2 at hand is inherited (it's the tty) and shared between *all*
> workers on all CPUs.
> 
> Ignoring some fluff, it's this in a loop:
> dup2(2, 1024)                           = 1024
> dup2(2, 1025)                           = 1025
> dup2(2, 1026)                           = 1026
> dup2(2, 1027)                           = 1027
> dup2(2, 1028)                           = 1028
> dup2(2, 1029)                           = 1029
> dup2(2, 1030)                           = 1030
> dup2(2, 1031)                           = 1031
> [..]
> close_range(1024, 1032, 0)              = 0
> 
> where fd 2 is the same file object in all 192 workers doing this.
> 

the following will still have *some* impact, but the drop should be much
lower

it also has a side effect of further helping the single-threaded case by
shortening the code when it works

diff --git a/include/linux/file_ref.h b/include/linux/file_ref.h
index 7db62fbc0500..c73865ed4251 100644
--- a/include/linux/file_ref.h
+++ b/include/linux/file_ref.h
@@ -181,17 +181,15 @@ static __always_inline __must_check bool file_ref_put_close(file_ref_t *ref)
 	long old, new;
 
 	old = atomic_long_read(&ref->refcnt);
-	do {
-		if (unlikely(old < 0))
-			return __file_ref_put_badval(ref, old);
-
-		if (old == FILE_REF_ONEREF)
-			new = FILE_REF_DEAD;
-		else
-			new = old - 1;
-	} while (!atomic_long_try_cmpxchg(&ref->refcnt, &old, new));
-
-	return new == FILE_REF_DEAD;
+	if (likely(old == FILE_REF_ONEREF)) {
+		new = FILE_REF_DEAD;
+		if (likely(atomic_long_try_cmpxchg(&ref->refcnt, &old, new)))
+			return true;
+		/*
+		 * The ref has changed from under us, don't play any games.
+		 */
+	}
+	return file_ref_put(ref);
 }
 
 /**
