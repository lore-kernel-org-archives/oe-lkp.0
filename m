Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F2E4CFA9
	for <oe-lkp@lists.linux.dev>; Wed, 27 Sep 2023 18:28:05 +0000 (UTC)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1qlYqn-00074l-Oq; Wed, 27 Sep 2023 20:01:29 +0200
Date: Wed, 27 Sep 2023 20:01:29 +0200
From: Florian Westphal <fw@strlen.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Florian Westphal <fw@strlen.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	netdev@vger.kernel.org, nharold@google.com, lorenzo@google.com,
	benedictwong@google.com, steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au
Subject: Re: [PATCH ipsec-next 2/2] xfrm: policy: replace session decode with
 flow dissector
Message-ID: <20230927180129.GD17767@breakpoint.cc>
References: <20230918125914.21391-3-fw@strlen.de>
 <202309271628.27fd2187-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309271628.27fd2187-oliver.sang@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

kernel test robot <oliver.sang@intel.com> wrote:
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202309271628.27fd2187-oliver.sang@intel.com
> 
> 
> kern  :warn  : [  173.147140] ------------[ cut here ]------------
> kern :warn : [  173.147759] WARNING: CPU: 12 PID: 2260 at net/core/flow_dissector.c:1096 __skb_flow_dissect (net/core/flow_dissector.c:1096 (discriminator 1)) 

Two options, more 'guess the right netns' in flow dissector:
derive netns from skb->dst->dev.

Or, pass struct net down to xfrm session decode functions.

I'll have a go at option 2 to see how much noise its going to be.
