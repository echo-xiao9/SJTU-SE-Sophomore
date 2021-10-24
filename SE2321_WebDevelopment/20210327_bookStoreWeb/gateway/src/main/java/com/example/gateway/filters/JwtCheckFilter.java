package com.example.gateway.filters;

import com.example.gateway.utils.jwt;
import com.example.gateway.vo.UserInfo;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.RouteToRequestUrlFilter;
import org.springframework.cloud.gateway.route.Route;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.util.UriComponentsBuilder;
import reactor.core.publisher.Mono;

import java.net.URI;

import static org.springframework.cloud.gateway.support.ServerWebExchangeUtils.GATEWAY_REQUEST_URL_ATTR;
import static org.springframework.cloud.gateway.support.ServerWebExchangeUtils.GATEWAY_ROUTE_ATTR;

@Slf4j
@Component
public class JwtCheckFilter implements GatewayFilter, Ordered {
    @SneakyThrows
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String jwtToken = exchange.getRequest().getHeaders().getFirst("token");
        UserInfo userInfo = jwt.parseToken(jwtToken);
        System.out.println(userInfo);
        if(userInfo != null && userInfo.getUserRole()!= null && userInfo.getUsername()!=null) {
            ServerHttpRequest request = exchange.getRequest().mutate()
                    .header("userName", userInfo.getUsername())
                    .build();
            return chain.filter(exchange.mutate().request(request).build());
        }
        throw new ResponseStatusException(HttpStatus.BAD_GATEWAY, "Jwt decode error");
    }
    @Override
    public int getOrder() {
        return 1;
    }
}