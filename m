Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BB24887E
	for <oe-lkp@lists.linux.dev>; Tue, 24 Jun 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748347; cv=none; b=q23pbMwJTH6m6zLitQnkk9z6+SsVvXuC1BnwVGC/76ydiWmkK+oLS5i6nhTm/+M2kG1Uij0HYjQxNANSVC6S8W8KQpqfXn7HqiQAtR0rvt1GMWwQV/0YtLzekqSH23pQnh7mO1G8DV1J282XDngaXYr+E9v49IZDnkVlVnnBhQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748347; c=relaxed/simple;
	bh=8hW06+Oi6aXyQGBxEENxLONlnfrfVnAKMV7nlvJQMEc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr3AhNsrTAULmTcVvKsi15VOYkKR7Ob74g4UQ/E3/TsggDQMOZ2pSKzMxJ3c3TWENIqPRGlYT8wIi0cqokXaSk0RXcrRk3Odg06b73YqUl5sflfb4M8El8upY3ytCywE+i0NJiQlivJ1pUvbXVnBwL8owDHfVCknYfspHIrAzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWIxIcNe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWIxIcNe"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade5b8aab41so1032369866b.0
        for <oe-lkp@lists.linux.dev>; Mon, 23 Jun 2025 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750748344; x=1751353144; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J10DU5OXaaKa8pBSa+RxsDs9i+snlpwIzDAMR9hFHps=;
        b=OWIxIcNe1vvhPBocknGluOpncv05Do9/vBjYmxHvBKpR8WWVfluHt1MKOepCYxsnXe
         mWspHms4LR7ckvNUpx76sG1DQime1Sx2JnOoeZigXGdxrUaMd9GNrXsHahQImWh/4lo0
         p5z08DElxbrAXUr1i/dtmR1viyBK3KZJ2Q9W1WV+/RJXVSzdP64ruvOtvah1QKb+4yA6
         C7UrY5V6AKFu4OgYZxNd6iUHwt6cVoDI+GM6+2nTgHbdnnqn++S5FoNH3lLPNXbI7uVH
         y3m9qkrwCRLzQjnWtYRZRemzdz0zj95B4EwAiFiHQ6QGYykDpecJ36jQb/tIy82UMSrE
         crJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748344; x=1751353144;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J10DU5OXaaKa8pBSa+RxsDs9i+snlpwIzDAMR9hFHps=;
        b=jrTHSh7YMueTaw4l82cgneC3+c1hFG65zsQ+dlWdQ7IFFMIX5z97LhmsQouP/hSDHb
         Ka2W9a3LdZgqtjtS8A6GOB5nWVXIMDbujn8Kmk800PSDwdhdno7cpX2RjR23mGc4nZFC
         Qkmh3pqLZC38/KnJNYgz9luOmJ5QK1j3t7Ux68JObXJAUPSJDeA+Zvh5IBeXq7NcNF7o
         OEURlNeDOAzIGQT8tXiNYaJ7sZM1XXE28f0iv58jNUGoouVPQobSpMiX9joXTp7sbZv6
         tDudFpFk9CCBZeg1da+DX7fqlMMLziCTXp6dg/eWP9POYEO6jIGy17SEFvg4ldBV6b2r
         cOSg==
X-Forwarded-Encrypted: i=1; AJvYcCUaoLcmVcxz3mTP5TqRS0+hRR0B5/znq6qE3kGhnXnzZNHXmxlSQXhDJyrWtHtXQaqBAn53zhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyWUKWqv1fT1WDmBMCe8/Q7SsNVMlxPfl5rPzQsH11u0CKrLKg
	tfgdvvLWt7GAi7gjSLunZTa7CHQa3t2QsUgjGMavCv/naDUAV6O6v/f4
X-Gm-Gg: ASbGncsiOMGCHKtZmP3YsmGSXdJ6NrvfoyoH3OG+lvXoySA37yXBtmJ4SY6O4RUH63t
	YsbX5JvKhP+6NQxhCLEuiljm48xqzv3oY74xwCTYQeJ369Slr9JuLtV8OcIWd63cL2Ut2VL9YZ6
	EK9l8r5ZIE0s94CYr1QX4BnhOp49m7xCJy5VD0hNmhVgZl8uINpVw+YSMZKuJrodkne97SSrIfZ
	6Pq+fQcaiAFuaMU2zBs3hMUkn79b6hvwqzRiycQxuRlaY9TIc67zLqqtb3aK9vBYb1kmefCOXnC
	Z1R02S39rraXyuLR3sc3157RfDEaWuk5KwWPvk94j6qNP9cCPE2HU3mSnlVO4g==
X-Google-Smtp-Source: AGHT+IFwJOaJYP9S+dxSSVpj8CnOJAOB3ww0QgJEVnw1xT1fcg5wPQQC/3ofWO1oGDUbSh4Oq4GnNA==
X-Received: by 2002:a17:906:6a11:b0:ade:44f8:569 with SMTP id a640c23a62f3a-ae057bc80d4mr1389882266b.42.1750748343397;
        Mon, 23 Jun 2025 23:59:03 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05407f52dsm833354966b.105.2025.06.23.23.59.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 23:59:03 -0700 (PDT)
Date: Tue, 24 Jun 2025 06:59:02 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Matthew Wilcox <willy@infradead.org>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [linux-next:master] [maple_tree]  540335e987:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <20250624065902.7c5d5jrhjxvwjvpq@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <202506191556.6bfc7b93-lkp@intel.com>
 <20250619154446.e9543f52bbc47e4bbd2cec29@linux-foundation.org>
 <20250620021420.7rgehvgrveyagqdd@master>
 <5f5fyv7kcaah4o4lnj6mc2zpptu5v27iajbpahykgakgzz3z2w@spevx4qf2aph>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f5fyv7kcaah4o4lnj6mc2zpptu5v27iajbpahykgakgzz3z2w@spevx4qf2aph>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Jun 23, 2025 at 05:19:07PM -0400, Liam R. Howlett wrote:
[...]
>
>This will need to be addressed once the dense nodes arrive, but it
>really should not happen right now.
>
>I don't like the idea of checking this every time we walk a node, if it
>can be avoided.
>
>> 
>> Sorry for the trouble. It is better to drop it.
>
>This indicates another issue exists which was exposed with your fix.
>
>I've tracked it down to the maple status being restored to ma_active
>before the maple state node is set.  The bot looks to have hit this by
>going mas_prev() on 0 and getting the status to ma_underflow, then
>mas_find(), which restored it to ma_active and tried to walk when the
>node was NULL in mas_find_setup().
>

The analysis looks reasonable. Thanks for your time.

>I have a fix for this and I'll roll your change into my fix and add you
>as the reporter... and add links to the resend, v3 patches, and this
>thread.  Stable will be excluded because it's really not worth the risk
>- the code is stable now but just suboptimal.
>
>This still leaves your initial patch 1 and 3, which has nothing to do
>with either of these bugs that you included in the patch set.  It is
>best to keep patches related to each other together, but not include
>things you find while developing those fixes, specifically for this
>scenario.
>
>I will grab those patches and re-examine them before sending them along,
>again.
>
>Thanks,
>Liam

-- 
Wei Yang
Help you, Help me
